###################### enums

# type
#   Direction = enum
#     north, east, south, west

# const x = Direction.north
# echo x

###################### using custom type in proc declaration - doesn't work as written

# proc print_direction(direction: enum):
#   var dir: int
#   echo dir

# print_direction(north)
# print_direction(Direction.east)

###################### subrange

# type
#   MySubrange = range[0..5]

###################### sets - some quirky behviour here compared to python

# import std/sets # Need this for larger basetype of a set

# var
#   smallSet: set[int16] = {1'i16}
#   bigSet: HashSet[int] = toHashSet( [1, 2, 3])
#   enumSet: set[Direction] = {north}
#   stringSet: HashSet[string] = toHashSet( ["hello"])

# echo smallSet
# echo bigSet
# echo enumSet
# echo stringSet

###################### procedure flags - often use sets

# Here we are using bitmaps
# This is a clan and type safe solution to defining
# integer constants that have to be or'ed together

# type
#   MyFlag* {.size: sizeof(cint).} = enum
#     A
#     B
#     C
#     D
#   MyFlags = set[MyFlag]

# proc toNum(f: MyFlags): int =
#   cast[cint](f)

# proc toFlags(v: int): MyFlags =
#   cast[MyFlags](v)

# echo toNum({})
# echo toNum({A})
# echo toNum({D})
# echo toNum({A, D})
# echo toFlags(0)
# echo toFlags(9)

###################### arrays

# arrays are fixed-length

# type
#   # I guess this is just more efficient that using the array type?
#   IntArray = array[0..5, int]

# let x: IntArray = [1, 2, 3, 4, 5, 6]
# echo x.low
# echo x.high
# for i in x:
#   echo i

###################### array indexing

# ok so there's something cool going on here
# looks like you can index arrays with any arbitrary type
# This can presumably be used like a dict is used in python

type
  Direction = enum
    north, east, south, west
  BlinkLights = enum
    off, on, slowBlink, mediumBlink, fastBlink
  LevelSetting = array[north..west, BlinkLights]

var
  level: LevelSetting

level[north] = on
level[south] = slowBlink
level[east] = fastBlink

# note that level[west] is not set, so it defaults to the default BlinkLights
# value, which is off

echo level
echo level.low
echo level.high


###################### nested arrays

