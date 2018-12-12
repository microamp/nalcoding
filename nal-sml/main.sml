(* utils start *)

fun length xs =
    case xs
     of [] => 0
      | _ :: xs' => 1 + length xs'

fun take xs n =
    if n > 0
    then hd xs :: take (tl xs) (n - 1)
    else []

fun drop xs n =
    if n > 0
    then drop (tl xs) (n - 1)
    else xs

(* utils end *)

fun merge_sorted l1 l2 =
    case [l1, l2]
     of [[], []] => []
      | [l1, []] => l1
      | [[], l2] => l2
      | [x :: xs, y :: ys] => if x < y
                              then x :: merge_sorted xs l2
                              else y :: merge_sorted l1 ys

fun mergesort xs =
    case xs
     of [] => []
      | x :: [] => [x]
      | _ =>
        let
            val len = length xs
            val n = (len div 2) + (len mod 2)
        in
            merge_sorted (mergesort (take xs n))
                         (mergesort (drop xs n))
        end
