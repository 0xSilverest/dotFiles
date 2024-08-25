import XMonad
import XMonad.Hooks.SetWMName
-- import XMonad.Config.Kde
import XMonad.Config.Desktop

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers (doCenterFloat, doFullFloat, isDialog, isFullscreen)
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Actions.CycleWS
import XMonad.Actions.SpawnOn

import XMonad.Layout.Tabbed
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.LayoutModifier

import qualified Data.Map as M
import Graphics.X11.ExtraTypes.XF86
import qualified XMonad.StackSet as W

import Control.Monad (liftM2)
import qualified DBus as D
import qualified DBus.Client as D

myStartupHook = do
  spawn "$HOME/.config/xmonad/scripts/autostart.sh"
  spawn "$HOME/.config/polybar/launch.sh"
  -- spawn "$HOME/.scripts/autoMonitor.sh"
  setWMName "XMonad"

normBord = "#292D3E"
focdBord = "#5A4F7F"
urgBord = "#FF3355"

mymodm = mod4Mask

myFocusFollowsMouse = False

myBorderWidth = 2

myWorkspaces = ["λ", "β", "γ", "δ"] --, "ε", "τ", "θ", "ϕ", "π", "σ"]

-- myBaseConfig = kdeConfig
myBaseConfig = desktopConfig

myFont = "xft:Fira Code:regular:size=11:antialias=true:hinting=true"

myTabTheme = def
    { fontName            = myFont
    , activeColor         = focdBord
    , inactiveColor       = "#181616"
    , urgentColor         = urgBord
    , activeBorderColor   = focdBord
    , inactiveBorderColor = "#282c34"
    , urgentBorderColor   = urgBord
    , activeTextColor     = "#e5e5e5"
    , inactiveTextColor   = "#e5e5e5"
    , urgentTextColor     = "#e5e5e5"
    , activeBorderWidth   = 0
    , inactiveBorderWidth = 0
    , urgentBorderWidth   = 0
    , decoHeight          = 20
    }

bs = 2

mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border 0 i i i) True (Border i i i i) True

myLayout = avoidStruts $ smartBorders $
           mySpacing bs tiled |||
           noBorders (tabbed shrinkText myTabTheme)
  where
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio = 1/2
    delta = 3/100

-- window manipulations
myManageHook =
  composeAll . concat $
  [ [isDialog --> doCenterFloat]
  , [className =? c --> doCenterFloat | c <- myCFloats]
  , [title =? t --> doFloat | t <- myTFloats]
  , [resource =? r --> doFloat | r <- myRFloats]
  , [resource =? i --> doIgnore | i <- myIgnores]
  , [ (className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "λ" | x <- my1Shifts]
  , [ (className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "β" | x <- my2Shifts]
  , [ (className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "γ" | x <- my3Shifts]
  , [ (className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "δ" | x <- my4Shifts]
  --, [ (className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "ε" | x <- my5Shifts]
  --, [ (className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "τ" | x <- my6Shifts]
  --, [ (className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "θ" | x <- my7Shifts]
  --, [ (className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "ϕ" | x <- my8Shifts]
  --, [ (className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "π" | x <- my9Shifts]
  --, [ (className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "σ" | x <- my10Shifts]
  , [isFullscreen --> (doF W.focusDown <+> doFullFloat)]
  ]
  where
    doShiftAndGo = doF . liftM2 (.) W.greedyView W.shift
    myCFloats = ["Arandr", "feh", "mpv", "vlc"]
    myTFloats = ["Downloads", "Save As...", "pavucontrol", "plasmashell"]
    myRFloats = ["plasmashell"]
    myIgnores = ["desktop_window", "dunst", "Timer"]
    my1Shifts = []
    my2Shifts = []
    my3Shifts = []
    my4Shifts = ["lutris", "steam"]
  --  my5Shifts = []

myMouseBindings XConfig {modMask = modm} =
  M.fromList
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, 1), \w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster)

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, 2), \w -> focus w >> windows W.shiftMaster)

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, 3), \w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster)
    ]

-- keys config
myKeys conf@XConfig {modMask = modm} =
  M.fromList $
  ----------------------------------------------------------------------
  -- SUPER + FUNCTION KEYS
  [ ((modm, xK_q), kill)
  , ((modm, xK_f), spawn "rofi -show drun")
  , ((modm, xK_e), spawn "rofi -show window")
  , ((modm, xK_r), spawn "rofi -show run")

  , ((modm, xK_b), spawn "firefox")
  , ((modm, xK_t), spawn "kitty")

  , ((modm, xK_Escape), spawn "xkill")

  , ((controlMask, xF86XK_AudioMute), spawn "change-audio-output")

  -- FUNCTION KEYS
  -- SUPER + SHIFT KEYS
  --, ((modm .|. shiftMask , xK_d ), spawn "dmenu_run -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'NotoMonoRegular:bold:pixelsize=14'")
  , ((modm .|. shiftMask, xK_r), spawn "xmonad --recompile && xmonad --restart")
  -- CONTROL + ALT KEYS
  --
  --, ((controlMask .|. mod1Mask, xK_i), spawn "nitrogen")
  --, ( (controlMask .|. mod1Mask, xK_k)
  -- , spawn "/home/silverest/.config/polybar/launch.sh")
  --, ((controlMask .|. mod1Mask, xK_l), spawn "pkill polybar")
  --, ((controlMask .|. mod1Mask, xK_o)
  --, spawn "$HOME/.xmonad/scripts/picom-toggle.sh")
  --, ((controlMask .|. mod1Mask, xK_s), spawn "spotify")
  --, ((controlMask .|. mod1Mask, xK_i), spawn "plasma-open-settings kcm_networkmanagement")
  --, ((controlMask .|. mod1Mask, xK_u), spawn "plasma-open-settings kcm_pulseaudio")
  -- ALT + ... KEYS
  --CONTROL + SHIFT KEYS
  --, ((controlMask .|. shiftMask, xK_Escape), spawn "xfce4-taskmanager")
  --SCREENSHOTS
  , ((0, xK_Print), spawn "flameshot gui")
  --MULTIMEDIA KEYS
  -- Mute volume
  , ((0, xF86XK_AudioMute), spawn "amixer -q set Master toggle")
  -- Decrease volume
  , ((0, xF86XK_AudioLowerVolume), spawn "amixer -q set Master 5%-")
  -- Increase volume
  , ((0, xF86XK_AudioRaiseVolume), spawn "amixer -q set Master 5%+")
  -- Disabled because of laptop drivers problems
  -- Increase brightness
  -- , ((0, xF86XK_MonBrightnessUp),  spawn "xbacklight -inc 5")
  -- Decrease brightness
  -- , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 5")
  --, ((modm, xF86XK_AudioPlay), spawn "mpc toggle")
  --, ((modm, xF86XK_AudioNext), spawn "mpc next")
  --, ((modm, xF86XK_AudioPrev), spawn "mpc prev")
  --, ((modm, xF86XK_AudioStop), spawn "mpc stop")
  , ((0, xF86XK_AudioPlay), spawn "playerctl play-pause")
  , ((0, xF86XK_AudioNext), spawn "playerctl next")
  , ((0, xF86XK_AudioPrev), spawn "playerctl previous")
  , ((0, xF86XK_AudioStop), spawn "playerctl stop")
  -- Navigation
  --, ((modm, xK_l), screenGo R False)
  --, ((modm, xK_h), screenGo L False)
  --, ((modm .|. controlMask, xK_l), screenSwap R False)
  --, ((modm .|. controlMask, xK_h), screenSwap L False)
  --------------------------------------------------------------------
  --  XMONAD LAYOUT KEYS
  -- Cycle through the available layout algorithms.
  , ((modm, xK_space), sendMessage NextLayout)
  --Focus selected desktop
  , ((modm, xK_Tab), nextWS)
  --  Reset the layouts on the current workspace to default.
  , ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)
  -- Move focus to the next window.
  , ((modm, xK_j), windows W.focusDown)
  -- Move focus to the previous window.
  , ((modm, xK_k), windows W.focusUp)
  -- Move focus to the master window.
  , ((modm .|. shiftMask, xK_m), windows W.focusMaster)
  --
  , ((modm .|. mod1Mask, xK_m), windows W.shiftMaster)
  -- Swap the focused window with the next window.
  , ((controlMask .|. modm, xK_j), windows W.swapDown)
  -- Swap the focused window with the previous window.
  , ((controlMask .|. modm, xK_k), windows W.swapUp)
  -- Shrink the master area.
  , ((controlMask .|. modm, xK_h), sendMessage Shrink)
  -- Expand the master area.
  , ((controlMask .|. modm, xK_l), sendMessage Expand)
  -- Push window back into tiling.
  , ((controlMask .|. modm, xK_t), withFocused $ windows . W.sink)
  -- Increment the number of windows in the master area.
  , ((controlMask .|. modm, xK_Left), sendMessage (IncMasterN 1))
  -- Decrement the number of windows in the master area.
  , ((controlMask .|. modm, xK_Right), sendMessage (IncMasterN (-1)))
  ] ++
  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [ ((m .|. modm, k), windows $ f i)
  | (i, k) <-
      zip
        (XMonad.workspaces conf)
        [xK_1, xK_2, xK_3, xK_4, xK_5] --, xK_6, xK_7, xK_8, xK_9, xK_0]
  , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
  ] {--, (\i -> W.greedyView i . W.shift i, shiftMask)--}
   ++
  -- ctrl-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
  -- ctrl-shift-{w,e,r}, Move client to screen 1, 2, or 3
  [ ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
  | (key, sc) <- zip [xK_d, xK_s] [0 ..]
  , (f, m) <- [(W.view, 0), (W.shift, controlMask)]
  ]

dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str =
  let opath  = D.objectPath_ "/org/xmonad/Log"
      iname  = D.interfaceName_ "org.xmonad.Log"
      mname  = D.memberName_ "Update"
      signal = D.signal opath iname mname
      body   = [D.toVariant str]
  in  D.emit dbus $ signal { D.signalBody = body }

polybarHook :: D.Client -> PP
polybarHook dbus =
  let wrapper c s | s /= "NSP" = wrap ("%{F" <> c <> "} ") " %{F-}" s
                  | otherwise  = mempty
      blue   = "#2E9AFE"
      gray   = "#7F7F7F"
      orange = "#ea4300"
      purple = "#9058c7"
      red    = "#722222"
  in  def { ppOutput          = dbusOutput dbus
          , ppCurrent         = wrapper blue
          , ppVisible         = wrapper gray
          , ppUrgent          = wrapper orange
          , ppHidden          = wrapper gray
          , ppHiddenNoWindows = wrapper red
          , ppTitle           = shorten 100 . wrapper purple
          }

myPolybarLogHook dbus = dynamicLogWithPP (polybarHook dbus)

mkDbusClient :: IO D.Client
mkDbusClient = do
  dbus <- D.connectSession
  _ <- D.requestName dbus (D.busName_ "org.xmonad.log") opts
  return dbus
 where
  opts = [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]

main = do
      dbus <- mkDbusClient
      xmonad . docks . ewmh  $ myBaseConfig
       { startupHook = myStartupHook
       , layoutHook = smartBorders $ myLayout ||| layoutHook myBaseConfig
       , manageHook = manageSpawn <+> myManageHook <+> manageHook myBaseConfig
       , modMask = mymodm
       , borderWidth = myBorderWidth
       , handleEventHook = handleEventHook myBaseConfig
       , focusFollowsMouse = myFocusFollowsMouse
       --, logHook = myLogHook
       , logHook = myPolybarLogHook dbus
       , workspaces = myWorkspaces
       , focusedBorderColor = focdBord
       , normalBorderColor = normBord
       , keys = myKeys
       , mouseBindings = myMouseBindings
       }

-- KDE Config
-- main :: IO ()
-- main = do
--   xmonad . docks $ ewmhFullscreen . ewmh $
--     myBaseConfig
--       { startupHook = myStartupHook
--       , layoutHook = smartBorders $ myLayout ||| layoutHook myBaseConfig
--       , manageHook = manageSpawn <+> myManageHook <+> manageHook myBaseConfig
--       , modMask = mymodm
--       , borderWidth = myBorderWidth
--       , handleEventHook = handleEventHook myBaseConfig
--       , focusFollowsMouse = myFocusFollowsMouse
--       , logHook = myLogHook
--       , workspaces = myWorkspaces
--       , focusedBorderColor = focdBord
--       , normalBorderColor = normBord
--       , keys = myKeys
--       , mouseBindings = myMouseBindings
--       }
