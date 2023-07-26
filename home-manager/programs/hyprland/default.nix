{pkgs, ...} :

let 
  monitor='',preferred,auto,1'';
  term = "${pkgs.alacritty}/bin/alacritty";
  dmenu = "${pkgs.rofi}/bin/rofi -modi drun -show drun -show-icons";

in {
    enable = true;
    extraConfig = ''

    exec-once=/home/lise/scripts/autostart
    monitor=eDP-1, preferred, auto, 1

    input {
      kb_layout=us
      kb_variant=
      #kb_model=
      #kb_options=
      #kb_rules=follow_mouse=1

      touchpad {
        natural_scroll=no
      }
    }

    misc{
    }

  general {
      sensitivity=1.0 # for mouse cursor
      gaps_in=5
      gaps_out=8
      border_size=3
      col.active_border=rgba(cba6f7ff) rgba(89b4faff) rgba(94e2d5ff) 10deg
      col.inactive_border=0xff45475a
      apply_sens_to_raw=0 # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)
      col.group_border=0xff89dceb
      col.group_border_active=0xfff9e2af
  }

  decoration {
      blur_new_optimizations = true
      drop_shadow = true
      shadow_range=100
      shadow_render_power=5
      col.shadow= 0x33000000
      col.shadow_inactive=0x22000000
      rounding=15
      blur=0
      blur_size=1 # minimum 1
      blur_passes=1 # minimum 1, more passes = more resource intensive.
      # Your blur "amount" is blur_size * blur_passes, but high blur_size (over around 5-ish) will produce artifacts.
      # if you want heavy blur, you need to up the blur_passes.
      # the more passes, the more you can up the blur_size without noticing artifacts.
  }

  animations {
      enabled=1
      # bezier=overshot,0.05,0.9,0.1,1.1
      bezier=overshot,0.13,0.99,0.29,1.1
      animation=windows,1,4,overshot,slide
      animation=border,1,10,default
      animation=fade,1,10,default
      animation=workspaces,1,6,overshot,slidevert
  }

  dwindle {
      pseudotile=1 # enable pseudotiling on dwindle
      force_split=0
  }

  master{
  }

  gestures {
      workspace_swipe=yes
      workspace_swipe_fingers=4
  }

  # example window rules
  # for windows named/classed as abc and xyz
  #windowrule=move 69 420,abc
  #windowrule=move center,title:^(fly_is_kitty)$
  #windowrule=size 800 500,title:^(fly_is_kitty)$
  #windowrule=animation slide,title:^(all_is_kitty)$
  #windowrule=float,title:^(all_is_kitty)$
  #windowrule=tile,xy
  #windowrule=tile,title:^(kitty)$
  #windowrule=float,title:^(fly_is_kitty)$
  #windowrule=float,title:^(clock_is_kitty)$
  #windowrule=size 418 234,title:^(clock_is_kitty)$
  #windowrule=pseudo,abc
  #windowrule=monitor 0,xyz

  # example binds
  bindm=SUPER,mouse:272,movewindow
  bindm=SUPER,mouse:273,resizewindow

  bind=SUPER,Return,exec,${term}
  #bind=SUPER,RETURN,exec,kitty --title fly_is_kitty
  #bind=ALT,RETURN,exec,kitty --single-instance
  bind=,Print,exec,/home/lise/scripts/screenshot
  # bind=SUPER,RETURN,exec,alacritty
  bind=SUPER SHIFT,Q,killactive,
  bind=SUPER SHIFT,E,exit,
  bind=SUPER,M,exec,nautilus
  bind=SUPER,S,togglefloating,
  #bind=SUPER,space,exec,wofi --show drun -o DP-3
  bind=SUPER,D,exec,${dmenu} 
  bind=SUPER,P,pseudo
  bind=SUPERSHIFT,s,exec,grimshot copy area
  bind=ALT,s,exec,grimblast --notify copy area

  
  bind=SUPER,X,exec,/home/lise/scripts/lock

  bind=SUPER,left,movefocus,l
  bind=SUPER,right,movefocus,r
  bind=SUPER,up,movefocus,u
  bind=SUPER,down,movefocus,d

  # bind=CTRL,1,workspace,1
  # bind=CTRL,2,workspace,2
  # bind=CTRL,3,workspace,3
  # bind=CTRL,4,workspace,4
  # bind=CTRL,5,workspace,5
  # bind=CTRL,6,workspace,6
  bind=SUPER,1,workspace,1
  bind=SUPER,2,workspace,2
  bind=SUPER,3,workspace,3
  bind=SUPER,4,workspace,4
  bind=SUPER,5,workspace,5
  bind=SUPER,6,workspace,6
  bind=SUPER,7,workspace,7
  bind=SUPER,8,workspace,8
  bind=SUPER,9,workspace,9
  #bind=SUPER,0,workspace,10

  bind=SUPER SHIFT,1,movetoworkspace,1
  bind=SUPER SHIFT,2,movetoworkspace,2
  bind=SUPER SHIFT,3,movetoworkspace,3
  bind=SUPER SHIFT,4,movetoworkspace,4
  bind=SUPER SHIFT,5,movetoworkspace,5
  bind=SUPER SHIFT,6,movetoworkspace,6
  bind=SUPER SHIFT,7,movetoworkspace,7
  bind=SUPER SHIFT,8,movetoworkspace,8
  bind=SUPER SHIFT,9,movetoworkspace,9
  bind=SUPER SHIFT,0,movetoworkspace,10

  bind=SUPER,mouse_down,workspace,e+1
  bind=SUPER,mouse_up,workspace,e-1

  bind=SUPER,g,togglegroup
  bind=SUPER,tab,changegroupactive

  # rec
  #bind=CTRL,1,exec,kitty --title fly_is_kitty --hold cava
  bind=CTRL,2,exec,code-insiders
  #bind=CTRL,3,exec,kitty --single-instance --hold donut.c
  #bind=CTRL,4,exec,kitty --title clock_is_kitty --hold tty-clock -C5
  '';
}
