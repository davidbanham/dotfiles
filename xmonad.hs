import XMonad
import XMonad.Util.Run(spawnPipe)
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
        "1:code", "2:www", "3:slack", "4:comms", "5:email", "6:harvest", "7:enpass", "8", "9"
      ]
      , manageHook = composeAll
        [ resource =? "crx_bikioccmkafdpakkkcpdbppfkghcmihk" --> doShift "4:comms"
        , resource =? "crx_nckgahadagoaajjgafhacjanaoiihapd" --> doShift "4:comms"
        , resource =? "prismatik.slack.com" --> doShift "3:slack"
        , className =? "Slack" --> doShift "3:slack"
        , resource =? "mail.google.com__mail_u_0" --> doShift "5:email"
        , resource =? "mail.google.com__mail_u_1" --> doShift "5:email"
        , resource =? "prismatik.harvestapp.com__time" --> doShift "6:harvest"
        , manageDocks
        ]
      , layoutHook = avoidStruts $ layoutHook defaultConfig
      }
      `additionalKeys`
      [ ((mod4Mask, xK_w ), spawn "google-chrome")
      ]
