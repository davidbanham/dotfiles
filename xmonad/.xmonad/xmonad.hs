import XMonad
import XMonad.Util.Run(spawnPipe)
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig

main = do

  xmproc <- spawnPipe "/usr/bin/xmobar"
  xmonad $ defaultConfig {
      modMask     = mod4Mask
      , borderWidth = 1
      , focusFollowsMouse  = True
      , workspaces = [
        "1:code", "2:www", "3:slack", "4:comms", "5:email", "6:asana", "7:enpass", "8", "9"
      ]
      , manageHook = composeAll
        [ resource =? "web.whatsapp.com" --> doShift "4:comms"
        , resource =? "prismatik.slack.com" --> doShift "3:slack"
        , resource =? "mail.google.com__mail_u_0" --> doShift "5:email"
        , resource =? "mail.google.com__mail_u_1" --> doShift "5:email"
        , resource =? "app.asana.com__0_161385269957318_list" --> doShift "6:asana"
        , resource =? "calendar.google.com__calendar_b_1_render" --> doShift "6:asana"
        , manageDocks
        ]
      , layoutHook = avoidStruts $ layoutHook defaultConfig
      }
      `additionalKeys`
      [ ((mod4Mask, xK_s ), spawn "firefox")
      ]
