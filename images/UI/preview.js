const buttons = [...document.querySelectorAll('.icon')];
const selected = new Map();
for (const button of buttons) button.addEventListener('click', () => {
  const kind = button.dataset.kind;
  const active = button.getAttribute('aria-pressed') !== 'true';
  for (const peer of buttons.filter(b => b.dataset.kind === kind)) peer.setAttribute('aria-pressed', 'false');
  if (active) { button.setAttribute('aria-pressed', 'true'); selected.set(kind, button.dataset.label); }
  else selected.delete(kind);
  document.getElementById('selection').textContent = [selected.get('verbs'), selected.get('objects')].filter(Boolean).join(' → ') || 'Ein Symbol auswählen oder mit der Maus darüberfahren.';
});
document.getElementById('size').addEventListener('change', e => document.documentElement.style.setProperty('--size', `${e.target.value}px`));
document.getElementById('surface').addEventListener('change', e => document.body.classList.toggle('light', e.target.value === 'light'));
document.getElementById('labels').addEventListener('change', e => document.body.classList.toggle('show-labels', e.target.checked));
