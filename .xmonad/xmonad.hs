-- import {{{
import qualified Data.Map as M
import Control.Monad (liftM2)          -- myManageHookShift
import Data.Monoid
import System.IO                       -- for xmobar

import XMonad
import qualified XMonad.StackSet as W  -- myManageHookShift

import XMonad.Actions.CopyWindow
import XMonad.Actions.CycleWS
import qualified XMonad.Actions.FlexibleResize as Flex -- flexible resize
import XMonad.Actions.FloatKeys
import XMonad.Actions.UpdatePointer
import XMonad.Actions.WindowGo

import XMonad.Hooks.DynamicLog         -- for xmobar
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks        -- avoid xmobar area
import XMonad.Hooks.ManageHelpers

import XMonad.Layout
import XMonad.Layout.DragPane          -- see only two window
import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders         -- In Full mode, border is no use
import XMonad.Layout.PerWorkspace      -- Configure layouts on a per-workspace
import XMonad.Layout.ResizableTile     -- Resizable Horizontal border
import XMonad.Layout.Simplest
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing           -- this makes smart space around windows
import XMonad.Layout.ToggleLayouts     -- Full window at any time
import XMonad.Layout.TwoPane

import XMonad.Prompt
import XMonad.Prompt.Window            -- pops up a prompt with window names
import XMonad.Util.EZConfig            -- removeKeys, additionalKeys
import XMonad.Util.Run
import XMonad.Util.Run(spawnPipe)      -- spawnPipe, hPutStrLn
import XMonad.Util.SpawnOnce

import Graphics.X11.ExtraTypes.XF86
-- }}}

-- Color Setting {{{
colorBlue      = "#868bae"
colorGreen     = "#00d700"
colorRed       = "#ff005f"
colorGray      = "#666666"
colorWhite     = "#bdbdbd"
colorNormalbg  = "#1c1c1c"
colorfg        = "#a8b6b8"

myFocusedBorderColor = "#ff0000"
myNormalBorderColor  = "#000000"
-- }}}

myModMask = mod3Mask

myTerminal = "$HOME/.local/bin/alacritty"

myWsBar = "xmobar $HOME/.xmonad/xmobarrc"

myStartupHook = do
    spawnOnce "nitrogen --restore"
    spawnOnce myTerminal

myLogHook h = dynamicLogWithPP $ wsPP { ppOutput = hPutStrLn h }

wsPP = xmobarPP { ppOrder           = \(ws:l:t:_)  -> [ws,t]
                , ppCurrent         = xmobarColor colorRed     colorNormalbg . \s -> "●"
                , ppUrgent          = xmobarColor colorGray    colorNormalbg . \s -> "●"
                , ppVisible         = xmobarColor colorRed     colorNormalbg . \s -> "◎"
                , ppHidden          = xmobarColor colorGray    colorNormalbg . \s -> "●"
                , ppHiddenNoWindows = xmobarColor colorGray    colorNormalbg . \s -> "○"
                , ppTitle           = xmobarColor colorRed     colorNormalbg
                , ppOutput          = putStrLn
                , ppWsSep           = " "
                , ppSep             = "  "
                }

gapwidth = 0
gwU = 0
gwD = 0
gwL = 0
gwR = 0
myLayout = spacing gapwidth $ gaps [(U, gwU),(D, gwD),(L, gwL),(R, gwR)]
           $ (ResizableTall 1 (1/201) (116/201) [])
             ||| (TwoPane (1/201) (116/201))
             ||| Simplest

main :: IO ()
main = do
    wsbar <- spawnPipe myWsBar
    xmonad $ ewmh def {
     modMask            = myModMask
    ,terminal           = myTerminal
    ,borderWidth        = 3
    ,focusedBorderColor = myFocusedBorderColor
    ,focusFollowsMouse  = True
    ,normalBorderColor  = myNormalBorderColor
    ,startupHook        = myStartupHook
    ,logHook            = myLogHook wsbar
                >> updatePointer (1,1) (0,0)
    , layoutHook        = avoidStruts $ ( toggleLayouts (noBorders Full)
                $ onWorkspace "3" simplestFloat
                $ onWorkspace "5" (
                    spacing 14
                    $ gaps [(U, 2),(D, 2),(L, 5),(R, 5)]
                    $ ResizableTall 0 (1/42) (1/2) [])
                $ myLayout
                )
}



-- vim: ft=haskell
