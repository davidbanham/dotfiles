import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Actions.Volume
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig

main = do

  xmproc <- spawnPipe "/usr/bin/xmobar"
  xmonad $ defaultConfig {
      terminal    = "gnome-terminal"
      , modMask     = mod4Mask
      , borderWidth = 1
      , focusFollowsMouse  = True
      , workspaces = [
        "1:code", "2:www", "3:slack", "4:comms", "5:email", "6:asana", "7:enpass", "8", "9"
      ]
      , manageHook = composeAll
        [ resource =? "crx_bikioccmkafdpakkkcpdbppfkghcmihk" --> doShift "4:comms"
        , resource =? "crx_nckgahadagoaajjgafhacjanaoiihapd" --> doShift "4:comms"
        , resource =? "web.whatsapp.com" --> doShift "4:comms"
        , resource =? "prismatik.slack.com" --> doShift "3:slack"
        , resource =? "www.flowdock.com__app_prismatik" --> doShift "3:slack"
        , className =? "Slack" --> doShift "3:slack"
        , resource =? "mail.google.com__mail_u_0" --> doShift "5:email"
        , resource =? "mail.google.com__mail_u_1" --> doShift "5:email"
        , resource =? "app.asana.com__0_161385269957318_list" --> doShift "6:asana"
        , resource =? "calendar.google.com__calendar_b_1_render" --> doShift "6:asana"
        , manageDocks
        ]
      , layoutHook = avoidStruts $ layoutHook defaultConfig
      }
      `additionalKeys`
      [ ((mod4Mask, xK_s ), spawn "google-chrome"),
        ((0, 0x1008ff13 ), raiseVolume 4 >> return ()),
        ((0, 0x1008ff11 ), lowerVolume 4 >> return ()),
        ((0, 0x1008ff12 ), spawn "amixer -D pulse set Master 1+ toggle"    >> return ()),
        ((0, 0x1008ff03 ), spawn "xbacklight -20"),
        ((0, 0x1008ff02 ), spawn "xbacklight +20")
      ]
