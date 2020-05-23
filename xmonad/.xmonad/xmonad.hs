-- Imports.
import XMonad
import XMonad.Hooks.DynamicLog

-- The main function.
main = xmonad =<< xmobar conf

-- Main configuration, override the defaults to your liking.
conf = def { modMask = mod4Mask
           , terminal = "alacritty" }
