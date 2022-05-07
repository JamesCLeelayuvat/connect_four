require "./lib/connect_four"
describe Connect_four do
  describe "#create_board" do
    it "creates a new 4x4 board of nested arrays" do
      connect_four = Connect_four.new()
      expect(connect_four.create_board).to eql([[nil, nil, nil, nil, nil, nil],
                                                [nil, nil, nil, nil, nil, nil],
                                                [nil, nil, nil, nil, nil, nil],
                                                [nil, nil, nil, nil, nil, nil],
                                                [nil, nil, nil, nil, nil, nil],
                                                [nil, nil, nil, nil, nil, nil],
                                                [nil, nil, nil, nil, nil, nil]])
    end
  end
  describe "#show_board" do
    it "shows the board" do
      connect_four = Connect_four.new()
      connect_four.create_board
      expect(connect_four.show_board).to eql("⛒ ⛒ ⛒ ⛒ ⛒ ⛒ ⛒ \n⛒ ⛒ ⛒ ⛒ ⛒ ⛒ ⛒ \n⛒ ⛒ ⛒ ⛒ ⛒ ⛒ ⛒ \n⛒ ⛒ ⛒ ⛒ ⛒ ⛒ ⛒ \n⛒ ⛒ ⛒ ⛒ ⛒ ⛒ ⛒ \n⛒ ⛒ ⛒ ⛒ ⛒ ⛒ ⛒ \n")
    end
  end
  describe "#add_token" do
    it "adds a token on the board for player 1" do
      connect_four = Connect_four.new()
      expect(connect_four.add_token(0, 0)).to eql([[0, nil, nil, nil, nil, nil],
                                                   [nil, nil, nil, nil, nil, nil],
                                                   [nil, nil, nil, nil, nil, nil],
                                                   [nil, nil, nil, nil, nil, nil],
                                                   [nil, nil, nil, nil, nil, nil],
                                                   [nil, nil, nil, nil, nil, nil],
                                                   [nil, nil, nil, nil, nil, nil]])
    end
    it "adds a token on the board for player 2" do
      connect_four = Connect_four.new()
      expect(connect_four.add_token(0, 1)).to eql([[1, nil, nil, nil, nil, nil],
                                                   [nil, nil, nil, nil, nil, nil],
                                                   [nil, nil, nil, nil, nil, nil],
                                                   [nil, nil, nil, nil, nil, nil],
                                                   [nil, nil, nil, nil, nil, nil],
                                                   [nil, nil, nil, nil, nil, nil],
                                                   [nil, nil, nil, nil, nil, nil]])
    end
  end
 
  describe "#line_of_four?"
  it "checks if the board contains a line of four horizontally" do
    connect_four = Connect_four.new()
    connect_four.add_token(0, 1)
    connect_four.add_token(1, 1)
    connect_four.add_token(2, 1)
    connect_four.add_token(3, 1)
    expect(connect_four.line_of_four?).to eql(1)
  end
  it "checks if the board contains a line of four vertically" do
    connect_four = Connect_four.new()
    connect_four.add_token(0, 1)
    connect_four.add_token(0, 1)
    connect_four.add_token(0, 1)
    connect_four.add_token(0, 1)
    expect(connect_four.line_of_four?).to eql(1)
  end
  it "checks if the board contains a line of four ascending diagonally" do
    connect_four = Connect_four.new()
    connect_four.add_token(0, 1)

    connect_four.add_token(1, 2)
    connect_four.add_token(1, 1)

    connect_four.add_token(2, 2)
    connect_four.add_token(2, 2)
    connect_four.add_token(2, 1)

    connect_four.add_token(3, 2)
    connect_four.add_token(3, 2)
    connect_four.add_token(3, 2)
    connect_four.add_token(3, 1)

    expect(connect_four.line_of_four?).to eql(1)
  end
  it "checks if the board contains a line of four descending diagonally" do
    connect_four = Connect_four.new()
    connect_four.add_token(0, 2)
    connect_four.add_token(0, 2)
    connect_four.add_token(0, 2)
    connect_four.add_token(0, 1)

    connect_four.add_token(1, 2)
    connect_four.add_token(1, 2)
    connect_four.add_token(1, 1)

    connect_four.add_token(2, 2)
    connect_four.add_token(2, 1)

    connect_four.add_token(3, 1)
    expect(connect_four.line_of_four?).to eql(1)
  end
end
