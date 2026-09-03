const LEVELS=[
{name:'La fattoria',bg:0,items:[
{id:'cow',name:'Mucca',emoji:'🐄',audio:'https://upload.wikimedia.org/wikipedia/commons/4/48/Mudchute_cow_1.ogg'},
{id:'rooster',name:'Gallo',emoji:'🐓',audio:'https://upload.wikimedia.org/wikipedia/commons/c/c5/Rooster_crowing.ogg'},
{id:'sheep',name:'Pecora',emoji:'🐑',audio:'https://upload.wikimedia.org/wikipedia/commons/2/28/Sheep_bleat.ogg'},
{id:'horse',name:'Cavallo',emoji:'🐎',audio:'https://upload.wikimedia.org/wikipedia/commons/d/db/Wiehern.ogg'},
{id:'pig',name:'Maiale',emoji:'🐖',audio:'https://upload.wikimedia.org/wikipedia/commons/4/4a/Mudchute_pig_2.ogg'},
{id:'dog',name:'Cane',emoji:'🐕',audio:'https://upload.wikimedia.org/wikipedia/commons/a/a2/Barking_of_a_dog.ogg'}]},
{name:'La città',bg:1,items:[
{id:'bus',name:'Autobus',emoji:'🚌',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/WWS%20CityBusMANSG220horn.ogg'},
{id:'siren',name:'Sirena',emoji:'🚨',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/Siren.ogg'},
{id:'horn',name:'Clacson',emoji:'📣',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/Car%20Horn.wav'},
{id:'bell',name:'Campanello',emoji:'🔔',audio:'https://upload.wikimedia.org/wikipedia/commons/9/90/Doorbell-cheap-dingdong.ogg'},
{id:'train',name:'Treno',emoji:'🚆',audio:'https://upload.wikimedia.org/wikipedia/commons/7/7a/WWS_Signalhorntrainhorn.ogg'},
{id:'beep',name:'Semaforo',emoji:'🚦',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/Beep-09.ogg'}]},
{name:'Il mare',bg:2,items:[
{id:'wave',name:'Onde',emoji:'🌊',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/Small%20sea%20waves%20at%20rocky%20beach.opus'},
{id:'gull',name:'Gabbiano',emoji:'🐦',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/M%C3%B6wengeschrei.ogg'},
{id:'boat',name:'Barca',emoji:'⛵',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/Bl%C3%BCmlisalp%20Horn.ogg'},
{id:'dolphin',name:'Delfino',emoji:'🐬',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/161691%20felixblume%20dolphin-screaming-underwater-in-caribbean-sea-mexico.wav'},
{id:'splash',name:'Splash',emoji:'💦',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/Emptying%20syringe%20in%20water%20slow.ogg'},
{id:'shell',name:'Conchiglia',emoji:'🐚',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/Conch%20shell.ogg'}]},
{name:'La montagna',bg:3,items:[
{id:'eagle',name:'Aquila',emoji:'🦅'},{id:'deer',name:'Cervo',emoji:'🦌'},{id:'marmot',name:'Marmotta',emoji:'🐿️'},{id:'wind',name:'Vento',emoji:'💨'},{id:'cowbell',name:'Campanaccio',emoji:'🔔'},{id:'stream',name:'Ruscello',emoji:'🏞️'}]},
{name:'Il bosco',bg:4,items:[
{id:'wolf',name:'Lupo',emoji:'🐺',audio:'https://upload.wikimedia.org/wikipedia/commons/8/87/Wolf_howls.ogg'},
{id:'bear',name:'Orso',emoji:'🐻'},{id:'woodpecker',name:'Picchio',emoji:'🐦',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/Woodpeckerdrum.ogg'},
{id:'squirrel',name:'Scoiattolo',emoji:'🐿️'},{id:'stream',name:'Ruscello',emoji:'💧'},{id:'leaves',name:'Foglie',emoji:'🍃'}]},
{name:'La giungla',bg:5,items:[
{id:'monkey',name:'Scimmia',emoji:'🐒',audio:'https://upload.wikimedia.org/wikipedia/commons/b/b8/Howler_monkey.ogg'},
{id:'parrot',name:'Pappagallo',emoji:'🦜',audio:'https://upload.wikimedia.org/wikipedia/commons/7/7c/Talking_Parrot_%28Psittacula_krameri%29.ogg'},
{id:'jaguar',name:'Giaguaro',emoji:'🐆',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/Jaguar%20saw.flac'},
{id:'toucan',name:'Tucano',emoji:'🐦',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/Keel-billed%20toucan.ogg'},
{id:'rain',name:'Pioggia',emoji:'🌧️',audio:'https://upload.wikimedia.org/wikipedia/commons/3/3d/Rain.ogg'},
{id:'frog',name:'Rana',emoji:'🐸',audio:'https://upload.wikimedia.org/wikipedia/commons/9/9f/Single_Frog_Croak.oga'}]},
{name:'La notte',bg:6,items:[
{id:'owl',name:'Gufo',emoji:'🦉',audio:'https://upload.wikimedia.org/wikipedia/commons/e/e6/Short-eared_Owl.ogg'},
{id:'cricket',name:'Grillo',emoji:'🦗'},{id:'frog',name:'Rana',emoji:'🐸'},{id:'wolf',name:'Lupo',emoji:'🐺',audio:'https://upload.wikimedia.org/wikipedia/commons/8/87/Wolf_howls.ogg'},{id:'wind',name:'Vento',emoji:'💨'},{id:'nightbird',name:'Uccello',emoji:'🐦'}]},
{name:'Suoni monelli',bg:7,items:[
{id:'fart',name:'Puzzetta',emoji:'💨',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/Fart.ogg'},
{id:'burp',name:'Rutto',emoji:'🥴',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/Burp.ogg'},
{id:'raspberry',name:'Pernacchia',emoji:'😛',audio:'audio/pernacchia-claudio.ogg'},
{id:'sneeze',name:'Starnuto',emoji:'🤧',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/Sneeze.ogg'},
{id:'hiccup',name:'Singhiozzo',emoji:'😮',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/Hiccupsound.ogg'},
{id:'bla',name:'Bla bla',emoji:'🗯️',audio:'https://commons.wikimedia.org/wiki/Special:Redirect/file/Four%20Years%20Old%20child%20laughing.ogg'}]}
];
const raw=Number(new URLSearchParams(location.search).get('level')||0);
const levelIndex=Number.isFinite(raw)?Math.max(0,Math.min(7,raw)):0;
const level=LEVELS[levelIndex];
document.title='Memory Sonoro · '+level.name;
const art=document.querySelector('#art'),screen=document.querySelector('#screen'),grid=document.querySelector('#grid'),movesEl=document.querySelector('#moves'),pairsEl=document.querySelector('#pairs'),win=document.querySelector('#win');
art.classList.add('l'+level.bg);screen.classList.add('l'+level.bg);
let first=null,lock=false,moves=0,pairs=0,enabled=true,currentAudio=null,ctx=null;
function shuffle(a){a=[...a];for(let i=a.length-1;i;i--){const j=Math.floor(Math.random()*(i+1));[a[i],a[j]]=[a[j],a[i]]}return a}
function stopAudio(){if(currentAudio){try{currentAudio.pause();currentAudio.currentTime=0}catch(e){}currentAudio=null}}
function audioCtx(){ctx??=new(window.AudioContext||window.webkitAudioContext)();if(ctx.state==='suspended')ctx.resume();return ctx}
function fallbackBeep(){const c=audioCtx(),o=c.createOscillator(),g=c.createGain(),t=c.currentTime;o.type='triangle';o.frequency.value=330;g.gain.setValueAtTime(.08,t);g.gain.exponentialRampToValueAtTime(.001,t+.18);o.connect(g).connect(c.destination);o.start(t);o.stop(t+.2)}
function play(s){if(!enabled)return;stopAudio();if(!s.audio){fallbackBeep();return}const src=s.audio.startsWith('data:')?s.audio:s.audio+'?v=25';const a=new Audio(src);a.preload='auto';a.volume=1;currentAudio=a;const p=a.play();if(p&&p.catch)p.catch(()=>fallbackBeep())}
function reset(){stopAudio();grid.innerHTML='';first=null;lock=false;moves=pairs=0;movesEl.textContent=0;pairsEl.textContent=0;win.hidden=true;shuffle(level.items.flatMap(x=>[x,x])).forEach(s=>{const b=document.createElement('button');b.className='card';b.innerHTML=`<span class="inner"><span class="face back"></span><span class="face front"><span class="animal">${s.emoji}</span><span class="label">${s.name}</span></span></span>`;b.onclick=()=>pick(b,s);grid.appendChild(b)})}
function pick(card,s){if(lock||card.classList.contains('flipped'))return;card.classList.add('flipped');play(s);if(!first){first={card,s};return}moves++;movesEl.textContent=moves;lock=true;if(first.s.id===s.id){setTimeout(()=>{first.card.classList.add('matched');card.classList.add('matched');pairs++;pairsEl.textContent=pairs;first=null;lock=false;if(pairs===6)setTimeout(()=>win.hidden=false,350)},350)}else{setTimeout(()=>{first.card.classList.remove('flipped');card.classList.remove('flipped');first=null;lock=false},950)}}
document.querySelector('#restart').onclick=reset;document.querySelector('#again').onclick=reset;document.querySelector('#sound').onclick=()=>{enabled=!enabled;if(!enabled)stopAudio()};reset();
