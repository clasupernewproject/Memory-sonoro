// Memory Sonoro v64 — come v63, uscita finale verso SINISTRA.
(function(){
  const parade=document.querySelector('#finishParade');
  const tower=document.querySelector('#animalTower');
  const win=document.querySelector('#win');
  if(!parade||!tower||!win) return;

  const sizeRank={horse:100,cow:95,bear:94,jaguar:90,deer:86,wolf:82,pig:76,dog:70,sheep:68,dolphin:66,eagle:62,monkey:58,rooster:50,parrot:48,owl:47,toucan:45,gull:44,woodpecker:43,nightbird:42,squirrel:38,marmot:38,frog:30,cricket:22,bus:100,train:95,boat:85,wave:80,siren:70,horn:65,bell:50,beep:45,splash:40,shell:35,wind:30,rain:30,stream:30,leaves:25,cowbell:25,fart:55,burp:50,raspberry:45,sneeze:40,hiccup:35,bla:30};
  let running=false,allowWin=false,timers=[];
  const later=(fn,ms)=>{const t=setTimeout(fn,ms);timers.push(t);return t};
  const clearAll=()=>{timers.forEach(clearTimeout);timers=[]};

  function build(){
    tower.innerHTML='';
    tower.style.transition='none';
    tower.style.transform='translateX(-50%) rotate(0deg)';
    const ordered=[...level.items].sort((a,b)=>(sizeRank[b.id]||50)-(sizeRank[a.id]||50));
    ordered.forEach((s,i)=>{
      const el=document.createElement('span');
      const rank=Math.max(22,sizeRank[s.id]||50);
      const font=Math.max(34,Math.min(88,32+rank*.52));
      el.textContent=s.emoji;
      el.style.position='absolute';
      el.style.left='50%';
      el.style.bottom=(i*12)+'%';
      el.style.fontSize=`clamp(${Math.round(font*.66)}px,${(font/6.5).toFixed(1)}vw,${Math.round(font)}px)`;
      el.style.lineHeight='1';
      el.style.opacity='0';
      el.style.transform='translate(-50%,28px) scale(.35)';
      el.style.transition='opacity .38s ease, transform .46s cubic-bezier(.2,1.35,.35,1)';
      el.style.filter='drop-shadow(0 3px 3px #0003)';
      tower.appendChild(el);
    });
  }

  function showOneByOne(){
    [...tower.children].forEach((el,i)=>{
      later(()=>{
        el.style.opacity='1';
        el.style.transform='translate(-50%,0) scale(1)';
      },i*360);
    });
  }

  function wobble(){
    const seq=[-5,5,-4,4,0];
    tower.style.transition='transform .30s ease-in-out';
    seq.forEach((deg,i)=>later(()=>{
      tower.style.transform=`translateX(-50%) rotate(${deg}deg)`;
    },i*320));
  }

  function leave(){
    tower.style.transition='transform 1.45s cubic-bezier(.45,.02,.85,.35)';
    requestAnimationFrame(()=>requestAnimationFrame(()=>{
      tower.style.transform='translateX(-320%) rotate(-8deg)';
    }));
  }

  function run(){
    if(running)return;
    running=true;
    build();
    parade.style.display='block';
    showOneByOne();
    later(wobble,2500);
    later(leave,4400);
    later(()=>{
      parade.style.display='none';
      allowWin=true;
      win.hidden=false;
      running=false;
    },6100);
  }

  const watch=setInterval(()=>{
    if(!win.hidden&&!allowWin&&!running){
      win.hidden=true;
      run();
    }
  },80);

  function resetAnim(){
    clearAll();running=false;allowWin=false;
    parade.style.display='none';
    tower.innerHTML='';
  }
  const restart=document.querySelector('#restart');
  const again=document.querySelector('#again');
  if(restart){const old=restart.onclick;restart.onclick=()=>{resetAnim();if(old)old()}}
  if(again){const old=again.onclick;again.onclick=()=>{resetAnim();if(old)old()}}
})();
