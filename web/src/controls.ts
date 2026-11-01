import type { GameObject, GameView } from './engine';
type Locale = 'de' | 'en';
interface Icon {kind: string; id: number; symbol: string; file: string; label: Record<Locale,string>; command?: Record<Locale,string>}
export function objectCount(id: number): number { return id >= 40 ? 2 : id >= 27 ? 1 : 0; }
export function composeCommand(verb: string, objects: string[], english: boolean): string {
  return [verb, objects.join(english ? ' on ' : ' auf ')].filter(Boolean).join(' ');
}
export async function loadControls(host: HTMLElement, submit: (command: string) => void, openSaves: () => void, music: {enabled: () => boolean; toggle: () => void}) {
  const response = await fetch(`${import.meta.env.BASE_URL}icons/manifest.json`);
  if (!response.ok) throw new Error('Icon catalog could not be loaded');
  const {icons}: {icons: Icon[]} = await response.json();
  const verbs = new Map(icons.filter(i=>i.kind==='verbs').map(i=>[i.id,i]));
  const ui = new Map(icons.filter(i=>i.kind==='ui').map(i=>[i.symbol,i]));
  const objects = new Map(icons.filter(i=>i.kind==='objects').map(i=>[i.id,i]));
  let state: GameView | undefined, locale: Locale = 'de', selected: Icon | undefined;
  let chosen: GameObject[] = [], expanded = false, menu = false, labels = false;
  const tr = (de: string,en: string) => locale==='en'?en:de;
  function button(parent: HTMLElement, label: string, icon: Icon | undefined, action: ()=>void, pressed?: boolean) {
    const b = document.createElement('button'); b.type='button'; b.className=icon?'game-icon':'object-name';
    b.setAttribute('aria-label',label); b.title=label;
    if (pressed!==undefined) b.setAttribute('aria-pressed',String(pressed));
    if(icon){const img=document.createElement('img');img.src=`${import.meta.env.BASE_URL}icons/${icon.file}`;img.alt='';img.width=48;img.height=48;b.append(img);}
    const name=document.createElement('span');name.textContent=label;b.append(name);
    b.addEventListener('click',()=>{
      const focused=document.activeElement===b;
      action();
      // Rebuilding after a state update must not strand keyboard users on body.
      if(focused && document.activeElement===document.body){
        const buttons=Array.from(host.querySelectorAll<HTMLButtonElement>('button'));
        (buttons.find(next=>next.getAttribute('aria-label')===label)??buttons[0])?.focus({preventScroll:true});
      }
    });parent.append(b);return b;
  }
  let verbPanel: HTMLElement, objectPanel: HTMLElement;
  function row(title: string, objectRow = false) {
    const section=document.createElement('div');section.className=objectRow?'control-group object-group':'control-group action-group';
    section.setAttribute('role','group');section.setAttribute('aria-label',title);
    const h=document.createElement('h3');h.textContent=title;section.append(h);
    const items=document.createElement('div');items.className='icon-row';section.append(items);(objectRow?objectPanel:verbPanel).append(section);return items;
  }
  function render() {
    host.replaceChildren();host.classList.toggle('icon-labels',labels);
    if(!state || state.mode>=5)return;
    verbPanel=document.createElement('div');verbPanel.className='verb-panel';
    objectPanel=document.createElement('div');objectPanel.className='object-panel';
    host.append(verbPanel,objectPanel);
    if(state.mode!==0){
      if(state.mode===3){
        const answers=row(tr('Wie weiter?','What next?'));
        button(answers,tr('Neustart','Restart'),verbs.get(13),()=>submit(tr('neustart','restart')));
        button(answers,tr('Spielende','Quit'),verbs.get(12),()=>submit(tr('ende','quit')));
        button(answers,tr('Weiterspielen','Continue'),undefined,()=>submit(tr('abbrechen','cancel')));
      }
      if([1,2,4].includes(state.mode)){
        const answers=row(tr('Deine Antwort','Your answer'));
        button(answers,tr('Ja','Yes'),undefined,()=>submit(tr('ja','yes')));
        button(answers,tr('Nein','No'),undefined,()=>submit(tr('nein','no')));
      }
      return;
    }
    const toolbar=document.createElement('div');toolbar.className='icon-options';verbPanel.append(toolbar);
    button(toolbar,tr('Namen','Names'),undefined,()=>{labels=!labels;render();},labels);
    button(toolbar,expanded?tr('Basisverben','Basic verbs'):tr('Mehr Verben','More verbs'),undefined,()=>{
      expanded=!expanded;menu=false;render();
    },expanded && !menu);
    button(toolbar,tr('Menü','Menu'),undefined,()=>{
      menu=!menu;selected=undefined;chosen=[];render();
    },menu);
    if(menu){const saves=row(tr('Spielstände','Saved games'));
      button(saves,tr('Speichern / Laden','Save / Load'),ui.get('SAVE_LOAD'),openSaves);}
    const groups: [string,number[]][] = menu
      ? [[tr('Spiel & Anzeige','Game & display'),[15,16,13,12,2,22,1,3]]]
      : expanded
        ? [[tr('Weitere Aktionen','More actions'),[21,5,29,27,42,30,33,41,32,44,43,34,37,36,4,28,23,9,7]]]
        : [
          [tr('Erkunden','Explore'),[10,31]],
          [tr('Bewegen','Move'),[11,19,6,24]],
          [tr('Handeln','Act'),[38,39,35,40]],
        ];
    for(const [title,ids] of groups){const items=row(title);for(const id of ids){const icon=verbs.get(id)!;
      button(items,icon.label[locale],icon,()=>{
        if(!objectCount(id)){menu=false;submit(icon.command![locale]);return;}
        selected=icon;chosen=[];render();
        host.querySelector<HTMLButtonElement>('[data-object]')?.focus();
      },selected?.id===id);

    }}
    if(menu) {
      const items=verbPanel.querySelector('.action-group:last-child .icon-row') as HTMLElement;
      const enabled=music.enabled();
      const b=button(items,enabled?tr('Musik ausschalten','Mute music'):tr('Musik einschalten','Enable music'),
        enabled?verbs.get(17):ui.get('MUSIC_OFF'),()=>{
          music.toggle();render();host.querySelector<HTMLButtonElement>('[data-music]')?.focus({preventScroll:true});
        },enabled);
      b.dataset.music='';
    }
    const status=document.createElement('p');status.className='icon-selection';status.setAttribute('role','status');
    status.textContent=menu ? tr('Spiel & Anzeige','Game & display') : selected ? `${selected.label[locale]}${chosen.length?' → '+chosen[0].name:''} · ${tr(chosen.length?'Ziel auswählen':'Objekt auswählen',chosen.length?'Choose target':'Choose object')}` : tr('Was möchtest du tun?','What would you like to do?');
    verbPanel.append(status);
    if(selected)button(status,tr('Abbrechen','Cancel'),undefined,()=>{selected=undefined;chosen=[];render();});
    for(const carried of [false,true]){
      const items=row(carried?tr('Inventar','Inventory'):tr('Hier','Here'),true);
      const list=state.objects.filter(o=>o.carried===carried);
      if(!list.length){const empty=document.createElement('span');empty.textContent=tr('Leer','Empty');items.append(empty);}
      for(const object of list){
        const b=button(items,object.name,objects.get(object.id),()=>{
          const verb=selected??verbs.get(31)!;
          chosen.push(object);
          if(chosen.length<objectCount(verb.id)){selected=verb;render();host.querySelector<HTMLButtonElement>('[data-object]')?.focus();return;}
          const command=composeCommand(verb.command![locale],chosen.map(o=>o.name),locale==='en');
          selected=undefined;chosen=[];submit(command);
        },chosen.some(o=>o.id===object.id));
        b.dataset.object=String(object.id);
      }
    }
  }
  return {update(next: GameView, english: boolean){state=next;locale=english?'en':'de';selected=undefined;chosen=[];render();}, disable(){host.replaceChildren();}};
}
