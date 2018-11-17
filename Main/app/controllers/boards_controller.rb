class BoardsController < ApplicationController
  def index
    # データを全て取得
    @boards = Board.all
  end
  def new
    # コントローラー内で定義したインスタンス変数はビューで参照できる
    @board = Board.new
    # debug
    # bindig.pry
  end
  def create
    # createメソッドでデータベースに保存
    Board.create(board_params)
    # binding.pry
  end

  def show
    # idをキーに1件取得
    @board = Board.find(params[:id])
    # binding.pry
  end
  def edit
    @board = Board.find(params[:id])
  end
  def update
    board = Board.find(params[:id])
    board.update(board_params)

    # 詳細画面へリダイレクト
    redirect_to board
  end

  private
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end
