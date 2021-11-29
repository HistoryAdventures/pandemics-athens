let cnvs = document.getElementById('main_canvas');
let scroller = document.getElementById('scroller');
let cnvs_width, cnvs_height, scroll_height, bg_position, hor_pos;

let main_bg = new Image();
main_bg.src = 'imgs/bg.jpg';

let top_clouds = new Image();
top_clouds.src = 'imgs/cloud.png';

let fields = new Image();
fields.src = 'imgs/fields.png';

let building = new Image();
building.src = 'imgs/building.png';

let mdl_clouds = new Image();
mdl_clouds.src = 'imgs/cloud2.png';

let mountain = new Image();
mountain.src = 'imgs/mountain.png';

let building2 = new Image();
building2.src = 'imgs/buildings.png';

let crows = new Image();
crows.src = 'imgs/crows.png';

let fire = [];
let fire_counter = 0;
let fire_name = -1;
let fire_frame = 0;
for (let i=0; i<48; i++) {
  fire_frame < 1 ? fire_frame++ : fire_frame = 0;
  if(fire_frame == 1) {fire_name++};
  fire[i] = new Image();
  fire[i].src = 'imgs/fire_' + fire_name + '.png';
}

let character = [];
let character_counter = 0;
for (let i=0; i<28; i++) {
  character[i] = new Image();
  character[i].src = 'imgs/character_' + i + '.png';
}
for (let i=28; i<54; i++) {
  character[i] = new Image();
  character[i].src = 'imgs/character_' + (54 - i) + '.png';
}

let blink = new Image();
let blink_counter = 0;
blink.src = 'imgs/blink.png';

let corpses_01  = new Image();
corpses_01.src = 'imgs/corpses_01.png';

let corpses_02  = new Image();
corpses_02.src = 'imgs/corpses_02.png';

let corpses_03  = new Image();
corpses_03.src = 'imgs/corpses_03.png';

let corpses_04  = new Image();
corpses_04.src = 'imgs/corpses_04.png';

let crows2 = [];
let crows_counter = 0;
for (let i=0; i<15; i++) {
  crows2[i] = new Image();
  crows2[i].src = 'imgs/crows_' + i + '.png';
}

let crow = [];
for (let i=0; i<15; i++) {
  crow[i] = new Image();
  crow[i].src = 'imgs/crow_' + i + '.png';
}

let smoke = new Image();
smoke.src = 'imgs/smoke_0.png';

let building3 = new Image();
building3.src = 'imgs/buildings2.png';

let left_crowd = new Image();
left_crowd.src = 'imgs/fighters_left.png';

let right_crowd = [];
let right_crowd_counter = 0;
for (let i=0; i<48; i++) {
  right_crowd[i] = new Image();
  right_crowd[i].src = 'imgs/fighters_right_' + i + '.png';
}

let left_single = [];
for (let i=0; i<48; i++) {
  left_single[i] = new Image();
  left_single[i].src = 'imgs/fighters_single_' + i + '.png';
}

let angry_people_bg = new Image();
angry_people_bg.src = 'imgs/crowd_bg.png';

let angry_people = [];
let angry_people_counter = 0;
for (let i=0; i<48; i++) {
  angry_people[i] = new Image();
  angry_people[i].src = 'imgs/crowd_' + i + '.png';
}

let crowd_smoke = new Image();
crowd_smoke.src = 'imgs/crowd_smoke.png';

let woman = new Image();
woman.src = 'imgs/woman.png';

let woman_eyes = new Image();
let woman_blink = 0;
woman_eyes.src = 'imgs/woman_eyes.png';

let walker = new Image();
walker.src = 'imgs/walker.png';

let young_man = new Image();
young_man.src = 'imgs/young_man.png';

let young_man_head = [];
let young_man_counter = 0;
let head_wave = 0;
for (let i=0; i<24; i++) {
  young_man_head[i] = new Image();
  young_man_head[i].src = 'imgs/young_man_head_' + i + '.png';
}

let tube_bttm = new Image();
tube_bttm.src = 'imgs/tube_bottom.png';

let tube_top = new Image();
tube_top.src = 'imgs/tube_top.png';

let tube_water = [];
let tube_water_counter = 0;
for (let i=0; i<48; i++) {
  tube_water[i] = new Image();
  tube_water[i].src = 'imgs/tube_water_' + i + '.png';
}

let tube_hand = [];
let tube_hand_counter = 0;
let tube_hand_wave = 0;
for (let i=0; i<9; i++) {
  tube_hand[i] = new Image();
  tube_hand[i].src = 'imgs/tube_hand_' + i + '.png';
}

let tube_cloud = new Image();
tube_cloud.src = 'imgs/tube_cloud.png';

let tube2_bttm = new Image();
tube2_bttm.src = 'imgs/tube2_bttm.png';

let tube2_water = [];
for (let i=0; i<48; i++) {
  tube2_water[i] = new Image();
  tube2_water[i].src = 'imgs/tube2_water_' + i + '.png';
}

let tube2_head = [];
let tube2_counter = 0;
let tube2_head_wave = 0;
for (let i=0; i<24; i++) {
  tube2_head[i] = new Image();
  tube2_head[i].src = 'imgs/tube2_head_' + i + '.png';
}

let tube2_cloud = new Image();
tube2_cloud.src = 'imgs/tube2_cloud.png';

function setCanvas() {
  cnvs_width = window.innerWidth;
  cnvs_height = window.innerHeight;
  scroll_height = cnvs_height * 24;
  cnvs.setAttribute("width", cnvs_width);
  cnvs.setAttribute("height", cnvs_height);
  scroller.setAttribute("style", "height:" + scroll_height + "px;");
  if(cnvs_width / cnvs_height < 1.5) {
    cnvs.style.display = "none";
    document.getElementById('warning').style.display = "block";
  } else {
    cnvs.style.display = "block";
    document.getElementById('warning').style.display = "none";
  }
}

function getScrollPercent() {
  let h = document.documentElement, 
      b = document.body,
      st = 'scrollTop',
      sh = 'scrollHeight';
  return (h[st]||b[st]) / ((h[sh]||b[sh]) - h.clientHeight);
}

function easing(t) {
  t = 1-(--t)*t*t*t
  return t;
}

function draw() {

  // console.log(getScrollPercent());
  hor_pos < cnvs_width ? hor_pos++ : hor_pos = 0;
  
  document.getElementById('main_canvas').setAttribute("width", window.innerWidth);
  document.getElementById('main_canvas').setAttribute("height", window.innerHeight);
  bg_position = -4.6 * cnvs_width * getScrollPercent() + cnvs_height*getScrollPercent();


  var ctx = document.getElementById('main_canvas').getContext('2d');
  ctx.clearRect(0, 0, cnvs_width, cnvs_height);

  ctx.drawImage(main_bg, 0, bg_position, cnvs_width, cnvs_width * 4.6);

  if(getScrollPercent() < 0.2) {
    ctx.drawImage(top_clouds, hor_pos - cnvs_width, (bg_position * 1.2 + 0.065 * cnvs_width), cnvs_width*2, cnvs_width * 0.2817);
    ctx.drawImage(fields, 0, (bg_position * 1.04 + 0.39 * cnvs_width), cnvs_width, cnvs_width * 0.5625);
    ctx.drawImage(building, 0, (bg_position * 1.2 + 0.39 * cnvs_width), cnvs_width, cnvs_width * 0.5625);
  }

  if(getScrollPercent() < 0.35 && getScrollPercent() > 0.06) {
    ctx.drawImage(mountain, 0, (bg_position * 1.05 + 0.93 * cnvs_width), cnvs_width, cnvs_width * 0.2817);
    ctx.drawImage(mdl_clouds, hor_pos - cnvs_width, (bg_position * 1.2 + 0.8 * cnvs_width), cnvs_width*2, cnvs_width * 0.2817);
    ctx.drawImage(building2, 0, (bg_position * 1.15 + 0.98 * cnvs_width), cnvs_width, cnvs_width * 0.5625);
    fire_counter < 47 ? fire_counter++ : fire_counter = 0;
    ctx.drawImage(fire[fire_counter], 0.4635 * cnvs_width, (bg_position * 1.2 + 0.98 * cnvs_width), cnvs_width * 0.416, cnvs_width * 0.39);

    ctx.drawImage(corpses_01, 0, (bg_position * 1.2 + 1.33 * cnvs_width), cnvs_width, cnvs_width * 0.38);
    ctx.drawImage(corpses_02, 0, (bg_position * 1.28 + 1.37 * cnvs_width), cnvs_width, cnvs_width * 0.38);

    crows_counter < 14 ? crows_counter++ : crows_counter = 0;
    ctx.drawImage(crows2[crows_counter], cnvs_width - hor_pos * 1.1, (bg_position * 1.2 + 1.2 * cnvs_width) - hor_pos * 0.4, cnvs_width * 0.025, cnvs_width * 0.031);
    ctx.drawImage(crow[crows_counter], hor_pos * 2 - 100, (bg_position * 1.2 + 1.35 * cnvs_width) - hor_pos, cnvs_width * 0.032, cnvs_width * 0.032);

    ctx.drawImage(corpses_03, 0, (bg_position * 1.4 + 1.44 * cnvs_width), cnvs_width, cnvs_width * 0.38);
    ctx.drawImage(crows, 0, (bg_position * 1.15 + 0.98 * cnvs_width), cnvs_width, cnvs_width * 0.5625);
    ctx.drawImage(corpses_04, 0, (bg_position * 1.6 + 1.6 * cnvs_width), cnvs_width, cnvs_width * 0.38);

    character_counter < 53 ? character_counter++ : character_counter = 0;
    blink_counter < 159 ? blink_counter++ : blink_counter =2
    if(bg_position < (-.52 * cnvs_width)) { 
      let shift = -1 * (bg_position + .52 * cnvs_width);
      let image_shift;
      if(shift < 300) {
        image_shift = 300 - shift;
      } else {
        image_shift = 0;
      }
      ctx.drawImage(character[character_counter], 0.02 * cnvs_width - image_shift, (bg_position * 1.2 + 0.99 * cnvs_width) + image_shift, cnvs_width * 0.4, cnvs_width * 0.547);
      if(blink_counter >= 0 && blink_counter <= 5) {
        ctx.drawImage(blink, 0.02 * cnvs_width - image_shift, (bg_position * 1.2 + 0.99 * cnvs_width) + image_shift, cnvs_width * 0.4, cnvs_width * 0.547);
      }
    }
  }
 
  ctx.drawImage(smoke, 0, (bg_position * 1.38 + 1.9 * cnvs_width), cnvs_width, cnvs_width * 0.46);
  ctx.drawImage(building3, 0, (bg_position * 1.1 + 1.66 * cnvs_width), cnvs_width, cnvs_width * 0.468);

  if(bg_position < (-1.1 * cnvs_width)) { 
    let shift = -1 * (bg_position + 1.2 * cnvs_width);
    let image_shift;
    if(shift < 500) {
      image_shift = 500 - shift;
    } else {
      image_shift = 0;
    }
    ctx.drawImage(left_crowd, 0 - image_shift, (bg_position + 1.7 * cnvs_width), cnvs_width, cnvs_width * 0.245);
    right_crowd_counter < 47 ? right_crowd_counter++ : right_crowd_counter = 0;
    ctx.drawImage(right_crowd[right_crowd_counter], 0 + image_shift, (bg_position + 1.7 * cnvs_width), cnvs_width, cnvs_width * 0.245);
    ctx.drawImage(left_single[right_crowd_counter], 0 - image_shift / 3, (bg_position + 1.7 * cnvs_width), cnvs_width, cnvs_width * 0.245);
  }

  ctx.drawImage(angry_people_bg, 0, (bg_position * 1.2 + 2.35 * cnvs_width), cnvs_width, cnvs_width * 0.573);
  angry_people_counter < 47 ? angry_people_counter++ : angry_people_counter = 0;
  ctx.drawImage(angry_people[angry_people_counter], 0, (bg_position * 1.2 + 2.35 * cnvs_width), cnvs_width, cnvs_width * 0.573);
  ctx.drawImage(crowd_smoke, 0, (bg_position * 1.4 + 3.06 * cnvs_width), cnvs_width, cnvs_width * 0.573);

  if(bg_position < (-2.6 * cnvs_width)) { 
    let shift = -1 * (bg_position + 2.6 * cnvs_width);
    let image_opacity;
    let image_scale;
    if(shift < 100) {
      image_opacity = shift / 100;
    } else {
      image_opacity = 1;
    }
    if(shift < 1000) {
      image_scale = shift / 1000;
    } else {
      image_scale = 1;
    }
    ctx.globalAlpha = image_opacity;
    ctx.drawImage(woman, cnvs_width * 0.773, (bg_position +  2.83 * cnvs_width), cnvs_width * 0.169, cnvs_width * 0.42);
    woman_blink < 200 ? woman_blink++ : woman_blink = 0;
    if (woman_blink > 100 && woman_blink < 200) {
      ctx.drawImage(woman_eyes, cnvs_width * 0.773, (bg_position +  2.83 * cnvs_width), cnvs_width * 0.169, cnvs_width * 0.42);
    }
    ctx.drawImage(walker, cnvs_width * 0.24, (bg_position * 1.2 +  3.5 * cnvs_width), cnvs_width * easing(image_scale) * 0.129, cnvs_width * easing(image_scale) * 0.444);

    ctx.drawImage(young_man, cnvs_width * 0.552 - ((1 - easing(image_scale)) * 100), (bg_position * 1.2 +  3.35 * cnvs_width), cnvs_width * 0.2, cnvs_width * 0.5);
    head_wave < 200 ? head_wave++ : head_wave = 0;
    if(head_wave < 23) {
      young_man_counter < 23 ? young_man_counter++ : young_man_counter = 0;
    } else if (head_wave >= 23 && head_wave < 100) {
      young_man_counter = 23;
    } else if (head_wave >= 100 && head_wave < 123) {
      young_man_counter > 0 ? young_man_counter-- : young_man_counter = 23;
    }
    ctx.drawImage(young_man_head[young_man_counter], cnvs_width * 0.552 - ((1 - easing(image_scale)) * 100), (bg_position * 1.2 +  3.35 * cnvs_width), cnvs_width * 0.2, cnvs_width * 0.5);
  }

  if(bg_position < (-2.8 * cnvs_width)) { 
    let shift = -1 * (bg_position + 2.8 * cnvs_width);
    let shift_percent;
    if(shift < 700) {
      shift_percent = 1 - shift / 700;
    } else {
      shift_percent = 0;
    }
    ctx.drawImage(tube_bttm, cnvs_width * 0.427 + 800 * shift_percent, (bg_position * 1.15 + 3.8 * cnvs_width), cnvs_width * 0.52, cnvs_width * 0.443);
    tube_water_counter < 47 ? tube_water_counter++ : tube_water_counter = 0;
    ctx.drawImage(tube_water[tube_water_counter], cnvs_width * 0.427 + 800 * shift_percent, (bg_position * 1.15 + 3.8 * cnvs_width), cnvs_width * 0.52, cnvs_width * 0.443);

    tube_hand_wave < 300 ? tube_hand_wave++ : tube_hand_wave = 0;
    if(tube_hand_wave < 8) {
      tube_hand_counter < 8 ? tube_hand_counter++ : tube_hand_counter = 0;
    } else if (tube_hand_wave >= 8 && tube_hand_wave < 200) {
      tube_hand_counter = 8;
    } else if (tube_hand_wave >= 200 && tube_hand_wave < 208) {
      tube_hand_counter > 0 ? tube_hand_counter-- : tube_hand_counter = 8;
    }
    ctx.drawImage(tube_hand[tube_hand_counter], cnvs_width * 0.427 + 800 * shift_percent, (bg_position * 1.15 + 3.8 * cnvs_width), cnvs_width * 0.52, cnvs_width * 0.443);
    ctx.drawImage(tube_top, cnvs_width * 0.427 + 800 * shift_percent, (bg_position * 1.15 + 3.8 * cnvs_width), cnvs_width * 0.52, cnvs_width * 0.443);
  }

  ctx.drawImage(tube_cloud, - cnvs_width * 0.41, (bg_position * 1.2 + 3.9 * cnvs_width), cnvs_width * 2, cnvs_width * 0.41);

  ctx.drawImage(tube2_bttm, cnvs_width * 0.1, (bg_position * 1.2 + 4.7 * cnvs_width), cnvs_width * 0.7, cnvs_width * 0.516);
  ctx.drawImage(tube2_water[tube_water_counter], cnvs_width * 0.1, (bg_position * 1.2 + 4.7 * cnvs_width), cnvs_width * 0.7, cnvs_width * 0.516);
  tube2_head_wave < 200 ? tube2_head_wave++ : tube2_head_wave = 0;
  if(tube2_head_wave < 23) {
    tube2_counter < 23 ? tube2_counter++ : tube2_counter = 0;
  } else if (tube2_head_wave >= 23 && tube2_head_wave < 100) {
    tube2_counter = 23;
  } else if (tube2_head_wave >= 100 && tube2_head_wave < 123) {
    tube2_counter > 0 ? tube2_counter-- : tube2_counter = 23;
  }
  ctx.drawImage(tube2_head[tube2_counter], cnvs_width * 0.1, (bg_position * 1.2 + 4.7 * cnvs_width), cnvs_width * 0.7, cnvs_width * 0.516);
  ctx.drawImage(tube2_cloud, - cnvs_width, (bg_position + 4.32 * cnvs_width), cnvs_width * 2, cnvs_width * 0.39);


  setTimeout(function(){
    window.requestAnimationFrame(draw);
  }, 20);

}


document.addEventListener('DOMContentLoaded', (event) => {

  setCanvas();
  window.addEventListener( 'resize', setCanvas );
  window.requestAnimationFrame(draw);

})