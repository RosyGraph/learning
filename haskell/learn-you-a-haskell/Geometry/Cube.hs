module Geometry.Cube
( volume
, area
) where

volume :: Float -> Float
volume side = cuboidVolume side side side

area :: Float -> Float
area side = cuboidArea side side side
