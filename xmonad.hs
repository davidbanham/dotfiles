import XMonad
import XMonad.Util.Run(spawnPipe)
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import XMonad.Hooks.ManageDocks

main = do

  xmproc <- spawnPipe "/usr/bin/xmobar"
  xmonad defaultConfig
      { terminal    = "gnome-terminal"
      , modMask     = mod4Mask
      , borderWidth = 1
      , focusFollowsMouse  = True
      , workspaces = [
        "1:code", "2:www", "3:comms", "4:email", "5:overflow", "6", "7", "8", "9"
      ]
      , manageHook = composeAll
        [ resource =? "crx_bikioccmkafdpakkkcpdbppfkghcmihk" --> doShift "3:comms"
        , resource =? "crx_nckgahadagoaajjgafhacjanaoiihapd" --> doShift "3:comms"
        , resource =?"mail.google.com__mail_u_0" --> doShift "4:email"
        , resource =? "mail.google.com__mail_u_1" --> doShift "4:email"
        , manageDocks
        ]
      }
