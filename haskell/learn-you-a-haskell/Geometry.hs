module Geometry
( sphereVolume
, sphereArea
, cubeVolume
, cubeArea
, cuboidArea
, cuboidVolume
) where

sphereVolume :: Float -> Float
sphereVolume r = (4.0 / 3.0) * pi * (r ^ 3)

sphereArea :: Float -> Float
sphereArea r = 4 * pi * (r ^ 2)

cubeVolume :: Float -> Float
cubeVolume side = cuboidVolume side side side

cubeArea :: Float -> Float
cubeArea side = cuboidArea side side side

cuboidVolume :: Float -> Float -> Float -> Float
cuboidVolume a b c = rectArea a b * c

cuboidArea :: Float -> Float -> Float -> Float
cuboidArea a b c = rectArea a b *2 + rectArea a c * 2 + rectArea c b * 2

rectArea :: Float -> Float -> Float
rectArea a b = a * b
