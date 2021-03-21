-- Compiler flags --
{-# LANGUAGE NoMonomorphismRestriction #-}

-- Imports --
-- stuff
import XMonad
import Control.Monad (msum, when)
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import System.Exit

--util
import XMonad.Util.Run
import XMonad.Util.EZConfig
import XMonad.Util.Themes 

import Data.String.Utils

import XMonad.Prompt
import XMonad.Prompt.Theme
-- actions
import XMonad.Actions.GridSelect
import XMonad.Actions.SpawnOn
import XMonad.Actions.CycleWS
--import XMonad.Actions.Volume

-- hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.FadeInactive (fadeInactiveLogHook)


-- layouts
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.MouseResizableTile
import XMonad.Layout.Renamed
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Spiral
import XMonad.Layout.Grid
import XMonad.Layout.SimpleDecoration
import XMonad.Layout.DwmStyle
import XMonad.Layout.SimpleFloat
import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.Themes
-- import XMonad.Actions.DynamicWorkspaceGroups
import XMonad.Actions.CycleWindows

-- taffybar
import XMonad.Hooks.DynamicLog
import XMonad.StackSet (peek, integrate)
import DBus.Client
--import System.Taffybar.XMonadLog ( dbusLog )
import System.Taffybar.XMonadLog ( dbusLogWithPP, taffybarDefaultPP, taffybarPP, taffybarColor, taffybarEscape )
import System.Taffybar.Hooks.PagerHints (pagerHints)
      
import qualified XMonad.Util.ExtensibleState as XS
import Data.Set as Set
import XMonad.Util.SpawnOnce






-------------------------------------------------------------------------------
-- Main --
main :: IO ()
--main = xmonad =<< statusBar cmd pp kb conf
main = do
  client <- connectSession
  let pp = myTaffybarPP
  xmonad $ ewmh $ pagerHints $ myConfig { logHook = dbusLogWithPP client pp }

-------------------------------------------------------------------------------
-- Configs --
myConfig = ewmh defaultConfig { workspaces = workspaces'
                         , modMask = modMask'
                         , borderWidth = borderWidth'
                         , normalBorderColor = normalBorderColor'
                         , focusedBorderColor = focusedBorderColor'
                         , handleEventHook = fullscreenEventHook
                         , terminal = terminal'
                         , keys = keys'
                         , layoutHook = layoutHook' 
                         , logHook = myLogHook
                         , manageHook = manageHook' <+> doFloat
						 , startupHook = startup
                         } `additionalKeysP`
                         [ ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 5 -time 100 -steps 5")
                         , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5 -time 100 -steps 5")

                         ]

takeTopFocus = withWindowSet $ maybe (setFocusX =<< asks theRoot) takeFocusX . peek


myLogHook = takeTopFocus >> setWMName "LG3D" >> fadeInactiveLogHook 0.9


takeFocusX w = withWindowSet $ \ws -> do
    dpy <- asks display
    wmtakef <- atom_WM_TAKE_FOCUS
    wmprot <- atom_WM_PROTOCOLS

    protocols <- io $ getWMProtocols dpy w
    when (wmtakef `elem` protocols) $ do
        io $ allocaXEvent $ \ev -> do
            setEventType ev clientMessage
            setClientMessageEvent ev w wmprot 32 wmtakef currentTime
            sendEvent dpy w False noEventMask ev



-- startup hook
startup = do
  setWMName "LG3D"
  spawn "taffybar"
  spawnOn "mail" "thunderbird"
--  spawn "transset -n taffybar" -- doesn't work




-------------------------------------------------------------------------------
-- Window Management --
manageHook' = manageSpawn <+> manageDocks <+> manageHookA'
manageHookA' = composeAll [ isFullscreen             --> doFullFloat
                         , className =? "MPlayer"   --> doFloat
                         , className =? "Gimp"      --> doFloat
                         , className =? "Vlc"       --> doFloat
						 , className =? "Firefox"   --> doFloat
						 , className =? "Pidgin"    --> doFloat
						 , className =? "Gajim"		--> doFloat
						 , className =? "Gedit"		--> doFloat
						 , className =? "JDownloader" --> doFloat
                         , className =? "xpad"      --> doFloat
                         , className =? "indicator-stickynotes.py" --> doFloat
			 --, insertPosition Below Newer
			 , transience'
                         ]


-------------------------------------------------------------------------------
-- Looks --
bg = "#d0d0d0"
blank = ""
--customPP = defaultPP { ppCurrent = taffybarColor "#000000" "#FFAA00" . wrap "(" ")"
--myTaffybarPP = taffybarDefaultPP { ppCurrent = taffybarColor "purple" "red" . wrap "(" ")"
--                     -- , ppHiddenNoWindows = taffybarColor "#666666" ""
--                     , ppUrgent  = taffybarColor "#444444" blank . wrap "!?" "?!" 
--                     , ppLayout  = taffybarColor "#004411" bg
--                     , ppTitle   = taffybarColor "#660000" bg . shorten 80
--                     , ppSep     = taffybarColor "#000000" "" " ☎ "
--                     , ppOrder   = map (\y -> taffybarColor "#000000" bg (wrap " " " " y))
--                     }
myTaffybarPP :: PP
myTaffybarPP = defaultPP { ppCurrent       = taffybarColor "green" "" . taffybarEscape . wrap "[" "]"
                       , ppVisible         = taffybarEscape . wrap "(" ")"
                       , ppHidden          = taffybarEscape
                       , ppHiddenNoWindows = taffybarEscape
                       , ppUrgent          = taffybarColor "red" "yellow" . taffybarEscape
                       , ppTitle           = taffybarColor "green" "". taffybarEscape
                       , ppLayout          = taffybarEscape
                       }


myTaffybarPP' = taffybarDefaultPP {
    ppCurrent = taffybarColor "green" "blue"   . wrap "FF" " "
  , ppVisible = taffybarColor "green" "blue" . wrap " " " "
  , ppUrgent  = taffybarColor "green" "blue"          . wrap " " " "
  , ppLayout  = taffybarColor "green" "" . wrap " [" "] "
  , ppTitle   = taffybarColor "green" "" . shorten 50
  }

-- GridSelect
myGSConfig = defaultGSConfig { gs_cellwidth = 480 }

-- urgent notification
urgentConfig = UrgencyConfig { suppressWhen = Focused, remindWhen = Dont }

-- borders
borderWidth' = 0
normalBorderColor'  = "#3F3F3F"
focusedBorderColor' = "#5F5F5F"

-- tabs
tabTheme1 = defaultTheme { decoHeight = 16
                         , activeColor = "#a6c292"
                         , activeBorderColor = "#a6c292"
                         , activeTextColor = "#000000"
                         , inactiveBorderColor = "#000000"
                         }

-- workspaces
workspaces' = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
			  ++ ["F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12", "mail"]

-- layouts

layoutHook' = avoidStruts $ simpleDeco shrinkText (myTheme) layoutDef' 

myTheme = defaultTheme { activeColor         = "#1F1F1F"
                       , inactiveColor       = "#000000"
                       , activeBorderColor   = "#000000"
                       , inactiveBorderColor = "#000000"
                       , activeTextColor     = "#bbbbbb"
                       , inactiveTextColor   = "#999999"
                       , decoHeight          = 14
                       , decoWidth           = 2000 
                       }



layoutDef' = mrtile ||| tab ||| full ||| tcol ||| spir ||| grid
  where
    mrtile = renamed [Replace "mouseRT"] $ smartBorders mouseResizableTile{draggerType = FixedDragger {gapWidth = 9, draggerWidth = 9},
                                             fracIncrement=(6/100)
                                            }
    tcol = renamed [Replace "threecol"] $ ThreeCol 2 (3/100) (1/2) 
    spir = renamed [Replace "spiral"] $ spiral (4/3)
    rt = renamed [Replace "mrt"] $ ResizableTall 1 (2/100) (1/2) []
    tile = renamed [Replace "tile"] $ smartBorders rt
    mtile = renamed [Replace "mirrortile"] $ smartBorders $ Mirror rt
    tab = renamed [Replace "tab"] $ noBorders $ tabbed shrinkText tabTheme1
    full = renamed [Replace "full"] $ noBorders Full 
    grid = renamed [Replace "grid"] $ GridRatio (4/3)


-------------------------------------------------------------------------------
-- Terminal --
terminal' = "urxvt"
--terminal' = "roxterm"

-------------------------------------------------------------------------------
-- Keys/Button bindings --
-- modmask
modMask' = mod4Mask

-- keys
toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

keys' :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
keys' conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    -- launching and killing programs
    [ ((modMask .|. shiftMask, xK_Return), safeSpawn terminal' []) 
    , ((modMask .|. shiftMask, xK_z     ), spawn "urxvt -hold -e zsh -i -c 'pc'")
    , ((modMask,               xK_z     ), safeSpawn terminal' [])
    , ((modMask,               xK_p     ), safeSpawn "dmenu_run" []) 
    , ((modMask .|. shiftMask, xK_p     ), safeSpawn "gmrun" [])
    , ((modMask              , xK_f     ), safeSpawn "catfish" [])
    , ((modMask,               xK_y     ), safeSpawn "xfce4-appfinder" [])
--    , ((modMask .|. shiftMask, xK_m     ), safeSpawn "thunderbird" [])
    , ((modMask .|. shiftMask, xK_c     ), kill)

    -- grid
    , ((modMask,               xK_g     ), goToSelected myGSConfig)

    -- layouts
    , ((modMask,               xK_space ), sendMessage NextLayout)
    , ((modMask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- floating layer stuff
    , ((modMask,               xK_t     ), withFocused $ windows . W.sink)

    -- refresh (???)
    --, ((modMask,               xK_n     ), refresh)
    
    -- move shortcuts
    , ((modMask,               xK_Escape), moveTo Next EmptyWS)
    , ((modMask,               xK_Tab   ), moveTo Next NonEmptyWS  )
    , ((modMask .|. shiftMask, xK_Tab   ), moveTo Prev NonEmptyWS  )

    -- focus
    , ((modMask,               xK_j     ), windows W.focusDown)
    , ((modMask,               xK_k     ), windows W.focusUp)
    --, ((modMask,               xK_m     ), windows W.focusMaster)

    -- swapping
    , ((modMask,               xK_Return), windows W.swapMaster)
    , ((modMask .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modMask .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- increase or decrease number of windows in the master area
    , ((modMask              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modMask              , xK_period), sendMessage (IncMasterN (-1)))

    -- resizing
    , ((modMask,               xK_h     ), sendMessage Shrink)
    , ((modMask,               xK_l     ), sendMessage Expand)
    , ((modMask .|. shiftMask, xK_h     ), sendMessage MirrorShrink)
    , ((modMask .|. shiftMask, xK_l     ), sendMessage MirrorExpand)

    -- window selector
    , ((modMask                , xK_s), cycleRecentWindows [xK_Super_L] xK_s xK_w)
    , ((modMask                , xK_x), rotOpposite)
    , ((modMask                , xK_i), rotUnfocusedUp)
    , ((modMask                , xK_u), rotUnfocusedDown)
    , ((modMask .|. controlMask, xK_i), rotFocusedUp)
    , ((modMask .|. controlMask, xK_u), rotFocusedDown)

    -- brightness
    --, ((<XF86MonBrightnessDown>), spawn "xbacklight -dec 10")
    --, ((<XF86MonBrightnessUp>), spawn "xbacklight -inc 10")

    , ((0, xK_Print), spawn "scrot -u")
    , ((shiftMask              , xK_Print), spawn "scrot")

    -- theme selector
    , ((modMask .|. controlMask, xK_t), themePrompt myXPConfig)

    -- SPECIAL KEYS
--    , ((0, xF86XK_AudioRaiseVolume), spawn "/usr/bin/alsavol -i 2")
--    , ((0, xF86XK_AudioLowerVolume), spawn "/usr/bin/alsavol -d 2")
    , ((0, xF86XK_AudioMute), spawn "/usr/bin/alsavol -t")
    , ((0, xF86XK_AudioPrev), spawn "mpc prev")
    , ((0, xF86XK_AudioNext), spawn "mpc next")
    , ((0, xF86XK_AudioPlay), spawn "togglempdplay")
    , ((shiftMask, xF86XK_AudioMedia), spawn "mpc add /")
    , ((0, xF86XK_AudioMedia), spawn (terminal' ++ " -e ncmpcpp"))
    , ((0, xF86XK_HomePage), spawn "xscreensaver-command -lock")
    , ((0, xF86XK_Calculator), spawn "extcalc")

	-- volume controls
    , ((modMask, xF86XK_AudioLowerVolume     ), runProcessWithInput "alsavol" ["-d","6"] [] >>= newalert)
    , ((modMask, xF86XK_AudioRaiseVolume     ), runProcessWithInput "alsavol" ["-u","6"] [] >>= newalert)

    , ((shiftMask, xF86XK_AudioLowerVolume     ), runProcessWithInput "alsavol" ["-d","25"] [] >>= newalert)
    , ((shiftMask, xF86XK_AudioRaiseVolume     ), runProcessWithInput "alsavol" ["-u","25"] [] >>= newalert)

    , ((0, xF86XK_AudioLowerVolume     ), runProcessWithInput "alsavol" ["-d","2.9"] [] >>= newalert)
    , ((0, xF86XK_AudioRaiseVolume     ), runProcessWithInput "alsavol" ["-u","2.9"] [] >>= newalert)


    -- extra shortcut for mail screen
    , ((modMask              , xK_m     ), windows $ W.greedyView "mail" )
    , ((modMask .|. shiftMask , xK_m     ), windows $ W.shift "mail")
    , ((modMask              , xK_n     ), toggleWS )

    -- quit, or restart
    , ((modMask .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modMask .|. shiftMask, xK_p     ), spawn "tp")
    , ((modMask              , xK_q     ), spawn "killall -9 taffybar-linux-x86_64; xmonad --recompile; xmonad --restart")
    ]
    ++
    -- mod-[1..9] %! Switch to workspace N
    -- mod-shift-[1..9] %! Move client to workspace N
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) $ [xK_1 .. xK_9] ++ [xK_0, xK_minus, xK_equal] ++ [xK_F1 .. xK_F12] ++ [xK_BackSpace]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
--    ++
    -- mod-[w,e] %! switch to twinview screen 1/2
    -- mod-shift-[w,e] %! move window to screen 1/2
--    [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
--        | (key, sc) <- zip [xK_w, xK_e] [0..]
--        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

-------------------------------------------------------------------------------

newalert x = spawn $ "killall notify-osd; notify-send -t 200 --icon=" ++ switchIcon (read $ replace "\n" "" $ replace "%" "" x :: Int) ++ " 'Volume (vmix0-outvol) changed to " ++ x ++ "'"

clamp x = (x `max` 0) `min` 100

switchIcon :: Int -> String
switchIcon c  
    | c == 0 = "audio-volume-muted"
    | c <= 33 = "audio-volume-low"
    | c <= 66 = "audio-volume-medium"
    | c < 100 = "audio-volume-high"
    | c == 100 = "emblem-cool"


myXPConfig =
    XPC { font              = "-misc-fixed-*-*-*-*-10-*-*-*-*-*-*-*"
        , bgColor           = "#000000"
        , fgColor           = "#DDDDDD"
        , fgHLight          = "#FFFFFF"
        , bgHLight          = "#333333"
        , borderColor       = "#FFFFFF"
        , promptBorderWidth = 0
        , position          = Bottom
        , height            = 16
        , historySize       = 256
        , defaultText       = ""
        , autoComplete      = Nothing
        , historyFilter     = id
        , showCompletionOnTab = False
        , alwaysHighlight = False
        }
