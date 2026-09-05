// Memory Sonoro v65 — finale con uscita certa a SINISTRA e audio sbloccato su iPhone.
(function(){
  const parade=document.querySelector('#finishParade');
  const tower=document.querySelector('#animalTower');
  const win=document.querySelector('#win');
  if(!parade||!tower||!win) return;

  const sizeRank={horse:100,cow:95,bear:94,jaguar:90,deer:86,wolf:82,pig:76,dog:70,sheep:68,dolphin:66,eagle:62,monkey:58,rooster:50,parrot:48,owl:47,toucan:45,gull:44,woodpecker:43,nightbird:42,squirrel:38,marmot:38,frog:30,cricket:22,bus:100,train:95,boat:85,wave:80,siren:70,horn:65,bell:50,beep:45,splash:40,shell:35,wind:30,rain:30,stream:30,leaves:25,cowbell:25,fart:55,burp:50,raspberry:45,sneeze:40,hiccup:35,bla:30};
  let running=false,allowWin=false,timers=[],musicCtx=null;
  const later=(fn,ms)=>{const t=setTimeout(fn,ms);timers.push(t);return t};
  const clearAll=()=>{timers.forEach(clearTimeout);timers=[]};

  function unlockAudio(){
    if(levelIndex!==0) return;
    try{
      const AC=window.AudioContext||window.webkitAudioContext;
      if(!AC) return;
      if(!musicCtx) musicCtx=new AC();
      if(musicCtx.state==='suspended') musicCtx.resume();
      const o=musicCtx.createOscillator(),g=musicCtx.createGain();
      g.gain.value=.00001;o.connect(g).connect(musicCtx.destination);o.start();o.stop(musicCtx.currentTime+.01);
    }catch(e){}
  }
  document.addEventListener('pointerdown',unlockAudio,{passive:true});
  document.addEventListener('touchstart',unlockAudio,{passive:true});

  function playFarmTune(){
    if(levelIndex!==0 || !enabled) return;
    try{
      unlockAudio();
      if(!musicCtx) return;
      const notes={C4:261.63,D4:293.66,E4:329.63,F4:349.23,G4:392,A4:440,C5:523.25};
      const melody=[['C4',.28],['C4',.28],['C4',.28],['G4',.28],['A4',.28],['A4',.28],['G4',.55],['E4',.28],['E4',.28],['D4',.28],['D4',.28],['C4',.60],['G4',.28],['C5',.28],['C5',.28],['C5',.28],['G4',.28],['A4',.28],['A4',.28],['G4',.55],['E4',.28],['E4',.28],['D4',.28],['D4',.28],['C4',.70]];
      let t=musicCtx.currentTime+.03;
      melody.forEach(([n,d])=>{
        const o=musicCtx.createOscillator(),g=musicCtx.createGain();
        o.type='triangle';o.frequency.value=notes[n];
        g.gain.setValueAtTime(.0001,t);g.gain.exponentialRampToValueAtTime(.16,t+.02);g.gain.exponentialRampToValueAtTime(.0001,t+d);
        o.connect(g).connect(musicCtx.destination);o.start(t);o.stop(t+d+.02);t+=d;
      });
    }catch(e){}
  }

  function build(){
    tower.innerHTML='';
    tower.style.transition='none';
    tower.style.left='50%';
    tower.style.transform='translateX(-50%) rotate(0deg)';
    const ordered=[...level.items].sort((a,b)=>(sizeRank[b.id]||50)-(sizeRank[a.id]||50));
    ordered.forEach((s,i)=>{
      const el=document.createElement('span');
      const rank=Math.max(22,sizeRank[s.id]||50);
      const font=Math.max(34,Math.min(88,32+rank*.52));
      el.textContent=s.emoji;el.style.position='absolute';el.style.left='50%';el.style.bottom=(i*12)+'%';
      el.style.fontSize=`clamp(${Math.round(font*.66)}px,${(font/6.5).toFixed(1)}vw,${Math.round(font)}px)`;
      el.style.lineHeight='1';el.style.opacity='0';el.style.transform='translate(-50%,28px) scale(.35)';
      el.style.transition='opacity .38s ease, transform .46s cubic-bezier(.2,1.35,.35,1)';
      el.style.filter='drop-shadow(0 3px 3px #0003)';tower.appendChild(el);
    });
  }

  function showOneByOne(){[...tower.children].forEach((el,i)=>later(()=>{el.style.opacity='1';el.style.transform='translate(-50%,0) scale(1)'},i*360))}
  function wobble(){const seq=[-5,5,-4,4,0];tower.style.transition='transform .30s ease-in-out';seq.forEach((deg,i)=>later(()=>{tower.style.transform=`translateX(-50%) rotate(${deg}deg)`},i*320))}
  function leaveLeft(){
    tower.style.transition='left 1.5s cubic-bezier(.45,.02,.85,.35), transform 1.5s cubic-bezier(.45,.02,.85,.35)';
    requestAnimationFrame(()=>requestAnimationFrame(()=>{tower.style.left='-85%';tower.style.transform='translateX(-50%) rotate(-8deg)'}));
  }

  function run(){
    if(running)return;running=true;build();parade.style.display='block';playFarmTune();showOneByOne();
    later(wobble,2500);later(leaveLeft,4400);later(()=>{parade.style.display='none';allowWin=true;win.hidden=false;running=false},6200);
  }
  setInterval(()=>{if(!win.hidden&&!allowWin&&!running){win.hidden=true;run()}},80);
  function resetAnim(){clearAll();running=false;allowWin=false;parade.style.display='none';tower.innerHTML=''}
  const restart=document.querySelector('#restart'),again=document.querySelector('#again');
  if(restart){const old=restart.onclick;restart.onclick=()=>{resetAnim();if(old)old()}}
  if(again){const old=again.onclick;again.onclick=()=>{resetAnim();if(old)old()}}
})();
