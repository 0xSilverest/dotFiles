import XMonad
import XMonad.Hooks.SetWMName
--import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers (doCenterFloat, isDialog)
import XMonad.Config.Desktop
--import XMonad.Util.Run(spawnPipe)
import XMonad.Actions.SpawnOn
import XMonad.Actions.CycleWS

import System.Taffybar.Support.PagerHints (pagerHints)
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Layout.Spiral(spiral)
import XMonad.Layout.ThreeColumns
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Actions.Navigation2D
import XMonad.Actions.Minimize

import Graphics.X11.ExtraTypes.XF86
import qualified XMonad.StackSet as W
import qualified Data.Map as M
--import Control.Monad (liftM2)
--import qualified DBus as D
--import qualified DBus.Client as D


myStartupHook = do
    spawn "$HOME/.xmonad/scripts/autostart.sh"
    spawn "$HOME/.cabal/bin/taffybar"
    spawn "$HOME/.scripts/monitor.sh"
    setWMName "LG3D"

-- colours
normBord = "#4c566a"
focdBord = "#775eac"
--fore     = "#DEE3E0"
--back     = "#282c34"
--winType  = "#c678dd"

--mod4Mask= super key
--mod1Mask= alt key
--controlMask= ctrl key
--shiftMask= shift key

mymodm = mod4Mask
myFocusFollowsMouse = True
myBorderWidth = 2
--myWorkspaces    = ["\61612","\61899","\61947","\61635","\61502","\61501","\61705","\61564","\62150","\61872"]
--myWorkspaces    = ["1","2","3","4","5","6","7","8","9","10"]
myWorkspaces    = ["I","II","III","IV","V","VI","VII","VIII","IX","X"]

myBaseConfig = desktopConfig

-- window manipulations
myManageHook = composeAll . concat $
    [ [isDialog --> doCenterFloat]
    , [className =? c --> doCenterFloat | c <- myCFloats]
    , [title =? t --> doFloat | t <- myTFloats]
    , [resource =? r --> doFloat | r <- myRFloats]
    , [resource =? i --> doIgnore | i <- myIgnores]
    --, [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61612" | x <- my1Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61899" | x <- my2Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61947" | x <- my3Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61635" | x <- my4Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61502" | x <- my5Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61501" | x <- my6Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61705" | x <- my7Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61564" | x <- my8Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\62150" | x <- my9Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61872" | x <- my10Shifts]
    ]
    where
    -- doShiftAndGo = doF . liftM2 (.) W.greedyView W.shift
    myCFloats = ["Arandr", "Arcolinux-calamares-tool.py", "Arcolinux-tweak-tool.py", "Arcolinux-welcome-app.py", "Galculator", "feh", "mpv", "steam", "lutris"]
    myTFloats = ["Downloads", "Save As..."]
    myRFloats = []
    myIgnores = ["desktop_window"]
    --my1Shifts = ["alacritty", "kitty"]
    --my2Shifts = [""]
    --my3Shifts = ["qpdfview"]
    --my4Shifts = []
    -- my5Shifts = ["Gimp", "feh"]
    -- my6Shifts = ["vlc", "mpv"]
    -- my7Shifts = ["Virtualbox"]
    -- my8Shifts = ["Thunar"]
    -- my9Shifts = []
    --my10Shifts = ["discord"]




myLayout = spacingRaw True (Border 0 5 5 5) True (Border 5 5 5 5) True 
            $ avoidStruts 
            $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) 
            $ tiled ||| Mirror tiled ||| spiral (6/7)  ||| ThreeColMid 1 (3/100) (1/2) ||| Full 
    where
        tiled = Tall nmaster delta tiled_ratio
        nmaster = 1
        delta = 3/100
        tiled_ratio = 1/2


myMouseBindings XConfig {modMask = modm} = M.fromList 
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, 1), \w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster)

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, 2), \w -> focus w >> windows W.shiftMaster)

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, 3), \w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster)

    ]


-- keys config

myKeys conf@XConfig {modMask = modm} = M.fromList $
  ----------------------------------------------------------------------
  -- SUPER + FUNCTION KEYS

  [ ((modm, xK_h), spawn "bashtop" )
  , ((modm, xK_m), spawn "pragha" )
  , ((modm, xK_q), kill )
  , ((modm, xK_f), spawn "rofi -show run" )
  , ((modm, xK_r), spawn "rofi-theme-selector" )
  , ((modm, xK_t), spawn "kitty" )
  , ((modm, xK_v), spawn "pavucontrol" )
  , ((modm, xK_y), spawn "polybar-msg cmd toggle" )
  , ((modm, xK_x), spawn "arcolinux-logout" )
  , ((modm, xK_Escape), spawn "xkill" )
  , ((modm, xK_Return), spawn "kitty" )
  , ((modm, xK_F2), spawn "kdenlive" )
  , ((modm, xK_F3), spawn "inkscape" )
  , ((modm, xK_F4), spawn "gimp" )
  , ((modm, xK_F6), spawn "vlc --video-on-top" )
  , ((modm, xK_F7), spawn "virtualbox" )
  , ((modm, xK_F8), spawn "lutris" )
  , ((modm, xK_F9), spawn "steam" )
  , ((modm, xK_F10), spawn "spotify" )
  , ((modm, xK_F11), spawn "rofi -show run -fullscreen" )
  , ((modm, xK_F12), spawn "rofi -show run" )

  -- FUNCTION KEYS
  , ((0, xK_F12), spawn "xfce4-terminal --drop-down" )

  -- SUPER + SHIFT KEYS
   
  , ((modm .|. shiftMask , xK_d ), spawn "dmenu_run -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'NotoMonoRegular:bold:pixelsize=14'")
  , ((modm .|. shiftMask , xK_r ), spawn "xmonad --recompile && xmonad --restart")
  , ((modm .|. shiftMask , xK_q ), kill)
  -- , ((modm .|. shiftMask , xK_x ), io (exitWith ExitSuccess))

  -- CONTROL + ALT KEYS
  --
  , ((controlMask .|. mod1Mask , xK_b ), spawn "brave")
  , ((controlMask .|. mod1Mask , xK_e ), spawn "arcolinux-tweak-tool")
  , ((controlMask .|. mod1Mask , xK_f ), spawn "firefox")
  , ((controlMask .|. mod1Mask , xK_i ), spawn "nitrogen")
  , ((controlMask .|. mod1Mask , xK_k ), spawn "arcolinux-logout")
  , ((controlMask .|. mod1Mask , xK_l ), spawn "arcolinux-logout") 
  , ((controlMask .|. mod1Mask , xK_o ), spawn "$HOME/.xmonad/scripts/picom-toggle.sh")
  , ((controlMask .|. mod1Mask , xK_p ), spawn "pamac-manager")
  , ((controlMask .|. mod1Mask , xK_r ), spawn "rofi-theme-selector")
  , ((controlMask .|. mod1Mask , xK_s ), spawn "spotify")
  , ((controlMask .|. mod1Mask , xK_t ), spawn "kitty")
  , ((controlMask .|. mod1Mask , xK_u ), spawn "pavucontrol")
  , ((controlMask .|. mod1Mask , xK_Return ), spawn "kitty")

  -- ALT + ... KEYS
  


  --CONTROL + SHIFT KEYS

  , ((controlMask .|. shiftMask , xK_Escape ), spawn "xfce4-taskmanager")

  --SCREENSHOTS

  , ((0, xK_Print ), spawn "flameshot launcher")


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

--  , ((0, xF86XK_AudioPlay), spawn $ "mpc toggle")
--  , ((0, xF86XK_AudioNext), spawn $ "mpc next")
--  , ((0, xF86XK_AudioPrev), spawn $ "mpc prev")
--  , ((0, xF86XK_AudioStop), spawn $ "mpc stop")

  , ((0, xF86XK_AudioPlay), spawn "playerctl play-pause")
  , ((0, xF86XK_AudioNext), spawn "playerctl next")
  , ((0, xF86XK_AudioPrev), spawn "playerctl previous")
  , ((0, xF86XK_AudioStop), spawn "playerctl stop")

  -- Navigation
  , ((modm, xK_Right), screenGo R False)
  , ((modm, xK_Left ), screenGo L False)
  , ((modm .|. controlMask, xK_l ), screenSwap R False)
  , ((modm .|. controlMask, xK_h ), screenSwap L False)
  --------------------------------------------------------------------
  --  XMONAD LAYOUT KEYS

  -- Minimize
  , ((modm, xK_m), withFocused minimizeWindow)

  -- Cycle through the available layout algorithms.
  , ((modm, xK_space), sendMessage NextLayout)

  --Focus selected desktop
  , ((modm, xK_Tab), nextWS)

  --  Reset the layouts on the current workspace to default.
  , ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)

  -- Move focus to the next window.
  , ((modm, xK_j), windows W.focusDown)

  -- Move focus to the previous window.
  , ((modm, xK_k), windows W.focusUp  )

  -- Move focus to the master window.
  , ((modm .|. shiftMask, xK_m), windows W.focusMaster  )

  -- Swap the focused window with the next window.
  , ((mod1Mask .|. modm, xK_j), windows W.swapDown  )

  -- Swap the focused window with the previous window.
  , ((mod1Mask .|. modm, xK_k), windows W.swapUp  )

  -- Shrink the master area.
  , ((controlMask .|. shiftMask , xK_h), sendMessage Shrink)

  -- Expand the master area.
  , ((controlMask .|. shiftMask , xK_l), sendMessage Expand)

  -- Push window back into tiling.
  , ((controlMask .|. shiftMask , xK_t), withFocused $ windows . W.sink)

  -- Increment the number of windows in the master area.
  , ((controlMask .|. modm, xK_Left), sendMessage (IncMasterN 1))

  -- Decrement the number of windows in the master area.
  , ((controlMask .|. modm, xK_Right), sendMessage (IncMasterN (-1)))

  ]
  ++

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [((m .|. modm, k), windows $ f i)

   | (i, k) <- zip (XMonad.workspaces conf) [xK_1,xK_2,xK_3,xK_4,xK_5,xK_6,xK_7,xK_8,xK_9,xK_0]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)
   {--, (\i -> W.greedyView i . W.shift i, shiftMask)--}]]

  ++
  -- ctrl-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
  -- ctrl-shift-{w,e,r}, Move client to screen 1, 2, or 3
  [((m .|. controlMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
      | (key, sc) <- zip [xK_w, xK_e] [0..]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


--myBar = "taffybar"

main :: IO ()
main = do
    --dbus <- D.connectSession
    -- Request access to the DBus name
    {--_ <- D.requestName 
            dbus (D.busName_ "org.xmonad.Log")
            [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]
    --} 
    xmonad . 
        docks .
        ewmh . 
        pagerHints $ 
            myBaseConfig
                {startupHook = myStartupHook
, layoutHook = gaps [(U,35), (D,5), (R,5), (L,5)] $ myLayout ||| layoutHook myBaseConfig
, manageHook = manageSpawn <+> myManageHook <+> manageHook myBaseConfig
, modMask = mymodm
, borderWidth = myBorderWidth
, handleEventHook    = handleEventHook myBaseConfig <+> fullscreenEventHook
, focusFollowsMouse = myFocusFollowsMouse
, workspaces = myWorkspaces
, focusedBorderColor = focdBord
, normalBorderColor = normBord
, keys = myKeys
, mouseBindings = myMouseBindings
}
