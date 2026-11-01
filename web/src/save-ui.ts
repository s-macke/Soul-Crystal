import { SaveStore, type SaveState, type SaveRecord, type SaveKind } from './saves';
export function createSaveUI(options: {capture: ()=>SaveState|null; load: (record: SaveRecord)=>boolean; english: ()=>boolean}) {
  const store = new SaveStore(()=>window.localStorage);
  const dialog = document.getElementById('save-dialog') as HTMLDialogElement;
  const list = document.getElementById('save-list')!;
  const message = document.getElementById('save-message')!;
  const toast = document.getElementById('save-notice')!;
  const saveButton = document.getElementById('save-current') as HTMLButtonElement;
  const close = document.getElementById('save-close') as HTMLButtonElement;
  let timer: ReturnType<typeof setTimeout>;
  const testMode=import.meta.env.DEV && new URLSearchParams(location.search).get('test')==='1';
  type Fixture=SaveRecord & {label:string;commandIndex:number};
  let fixtures:Fixture[]=[];
  let fixtureMessage='';
  let fixtureRequest:Promise<void>|undefined;
  const testSection=document.createElement('section');testSection.id='test-save-list';
  testSection.setAttribute('aria-label','Testspielstände');
  if(testMode)list.before(testSection);
  async function fetchFixtures(){
    fixtureMessage=tr('Testspielstände werden geladen …','Loading test saves …');renderFixtures();
    try{
      const response=await fetch(`${import.meta.env.BASE_URL}__test-saves`,{cache:'no-store'});
      const data=await response.json();
      if(!response.ok)throw new Error(data.error??'Test saves unavailable');
      if(data.version!==1||!Array.isArray(data.fixtures))throw new Error('Invalid fixture catalog');
      fixtures=data.fixtures;fixtureMessage='';
    }catch(error){fixtureMessage=String(error);fixtureRequest=undefined;}
    renderFixtures();
  }
  function renderFixtures(){
    if(!testMode)return;
    testSection.replaceChildren();
    const heading=document.createElement('h3');heading.textContent=tr('Testspielstände · nur lokal','Test saves · local development only');
    const note=document.createElement('p');note.textContent=tr('Aus dem deutschen Replay erspielt. Unveränderliche Vorlagen, getrennt von deinen Spielständen.','Played through the German replay. Read-only templates, separate from your saves.');
    testSection.append(heading,note);
    if(fixtureMessage){const p=document.createElement('p');p.textContent=fixtureMessage;testSection.append(p);}
    for(const fixture of fixtures){
      const item=document.createElement('article');item.className='save-slot test-save';
      const title=document.createElement('h3');title.textContent=`${'ABCD'[fixture.part-1]} · ${fixture.label} · ${fixture.roomName}`;
      const detail=document.createElement('p');detail.textContent=`${fixture.score} ${tr('Punkte','points')} · ${tr('Replay-Befehl','Replay command')} ${fixture.commandIndex} · Deutsch`;
      const button=document.createElement('button');button.className='test-save-load';button.textContent=tr('Testspielstand laden','Load test save');button.setAttribute('aria-label',`${button.textContent}: ${fixture.label}`);
      button.onclick=()=>{try{if(!options.load(fixture))throw new Error('Invalid fixture');dialog.close();notify(tr('Testspielstand geladen.','Test save loaded.'));}catch{message.textContent=tr('Testspielstand nicht kompatibel. Vorlagen neu erzeugen.','Incompatible test save. Regenerate fixtures.');}};
      item.append(title,detail,button);testSection.append(item);
    }
  }
  const tr=(de:string,en:string)=>options.english()?en:de;
  function notify(text:string) {toast.textContent=text;clearTimeout(timer);timer=setTimeout(()=>{toast.textContent='';},6000);}
  function error() {return tr('Spielstände konnten nicht gelesen oder gespeichert werden. Browserspeicher prüfen; vorhandene Daten bleiben erhalten. Maximal 20 manuelle Spielstände.','Could not read or write saves. Check browser storage; existing data is preserved. Maximum 20 manual saves.');}
  function render() {
    list.replaceChildren();message.textContent='';renderFixtures();
    document.getElementById('save-title')!.textContent=tr('Spielstände','Saved games');
    document.getElementById('save-local')!.textContent=tr('In diesem Browser gespeichert · 20 manuelle Spielstände und die letzten 8 Autosaves.','Stored in this browser · 20 manual saves and the latest 8 autosaves.');
    saveButton.textContent=tr('Neuen Spielstand speichern','Save current game');
    close.textContent=tr('Schließen','Close');
    const canSave=options.capture()!==null;
    saveButton.hidden=!canSave;saveButton.disabled=!canSave;
    try {
      const records=store.list();
      if(!records.length)message.textContent=tr('Noch keine Spielstände.','No saved games yet.');
      for(const record of records){
        const item=document.createElement('article');item.className='save-slot';
        const title=document.createElement('h3');title.textContent=`${record.roomName} · ${tr('Teil','Part')} ${'ABCD'[record.part-1]}`;
        const detail=document.createElement('p');
        const kinds={manual:tr('Manuell','Manual'),start:tr('Autosave: Spielbeginn','Autosave: Start'),room:tr('Autosave: Raumwechsel','Autosave: Room'),part:tr('Autosave: Teilwechsel','Autosave: Part'),death:tr('Autosave: vor dem Tod','Autosave: Before death')};
        detail.textContent=`${kinds[record.kind]} · ${new Date(record.created).toLocaleString(options.english()?'en':'de')} · ${record.score} ${tr('Punkte','points')} · ${record.language?'English':'Deutsch'}`;
        const load=document.createElement('button');load.className='save-load';load.textContent=tr('Laden','Load');load.setAttribute('aria-label',`${load.textContent}: ${title.textContent}`);
        load.onclick=()=>{try{if(!options.load(record))throw new Error('Invalid snapshot');dialog.close();notify(tr('Spielstand geladen.','Game loaded.'));}catch{message.textContent=tr('Dieser Spielstand ist beschädigt oder nicht kompatibel.','This save is damaged or incompatible.');}};
        const remove=document.createElement('button');remove.className='save-delete';remove.textContent=tr('Löschen','Delete');let confirm=false;
        remove.onclick=()=>{if(!confirm){confirm=true;remove.textContent=tr('Löschen bestätigen','Confirm delete');return;}try{store.remove(record.id);render();}catch{message.textContent=error();}};
        item.append(title,detail,load,remove);list.append(item);
      }
    }catch{message.textContent=error();}
  }
  saveButton.onclick=()=>{const state=options.capture();if(!state)return;try{store.add(state,'manual');render();message.textContent=tr('Spielstand gespeichert.','Game saved.');}catch{message.textContent=error();}};
  close.onclick=()=>dialog.close();
  return {
    open(){render();dialog.showModal();if(testMode&&!fixtures.length&&!fixtureRequest)fixtureRequest=fetchFixtures();},
    auto(state:SaveState|null,kind:SaveKind){if(!state)return;try{store.add(state,kind);notify(tr('Automatisch gespeichert.','Autosaved.'));}catch{notify(error());}},
  };
}
