require_relative '../lib/board'


x =  [ [nil, nil, nil, nil, nil, nil, nil],
[nil, nil, nil, nil, nil, nil, nil],
[nil, nil, nil, nil, nil, nil, nil],
[nil, nil, nil, nil, nil, nil, nil],
[nil, nil, nil, 'O', 'O', 'O', 'O'],
[nil, nil, nil, 'O', 'O', 'O', 'O']]

tablero = Board.new(x)

tablero.print_board

