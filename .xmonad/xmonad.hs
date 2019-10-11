import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops
import XMonad.Actions.CycleWS
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.LayoutCombinators hiding ( (|||) )
import XMonad.Actions.DwmPromote
import System.IO

myLayout = tall ||| Full

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ defaultConfig
        { manageHook = manageHook defaultConfig <+> manageDocks
        , layoutHook = avoidStruts . smartBorders $ myLayout
        , handleEventHook = handleEventHook defaultConfig <+> docksEventHook <+> fullscreenEventHook
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "gray" "" . shorten 100
                        , ppCurrent = xmobarColor "white" ""
                        , ppVisible = xmobarColor "white" ""
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , terminal = "st"
        , borderWidth = 1
        } `additionalKeys`
        [       ((0,            0x1008ff11),   spawn            "volume 1%-"),
                ((0,            0x1008ff13),   spawn            "volume 1%+"),
                ((0,            0x1008ff12),   spawn            "volume toggle"),
                ((0,            0x1008FF02),   spawn            "light -A 5"),
                ((0,            0x1008FF03),   spawn            "light -U 5"),
                ((mod4Mask,     xK_a),         spawn            "pavucontrol"),
                ((mod4Mask,     xK_n),         spawn            "networkmanager_dmenu -fn 'RobotoMono Nerd Font:pixelsize=18' -sb '#e1a3ee' -sf '#000000'"),
                ((mod4Mask,     xK_p),         spawn            "dmenu_run -fn 'RobotoMono Nerd Font:pixelsize=18' -sb '#e1a3ee' -sf '#000000'"),
                ((mod4Mask,     xK_b),         sendMessage      ToggleStruts),
                ((mod4Mask,     xK_Insert),    spawn            "clipmenu -i -fn 'RobotoMono Nerd Font:pixelsize=18' -sb '#e1a3ee' -sf '#000000'"),
                ((mod4Mask,     xK_Tab),       toggleWS),
                ((mod4Mask,     xK_Home),      spawn            "st 'ranger'"),
                ((mod4Mask,     xK_Return),     dwmpromote)
        ]

tall = Tall 1 (3/100) (1/2)
