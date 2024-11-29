class BoardsController < ApplicationController
  before_action :set_tagrget_board, only: %i[show edit update destroy]
  def index
    # データを全て取得
    @boards = Board.page(params[:page])
  end
  def new
    # コントローラー内で定義したインスタンス変数はビューで参照できる
    @board = Board.new(flash[:board])
    # debug
    # bindig.pry
  end
  def create
    # createメソッドでデータベースに保存
    board = Board.new(board_params)
    # 保存の成否によって条件分岐
    if board.save
      flash[:notice] = "「#{board.title}」の掲示板を作成しました"
      redirect_to board || ""
    else
      redirect_to new_board_path, flash: {
        # 入力したフォームの情報をセット
        board: board,
        # saveメソッドで発行される
        error_messages: board.errors.full_messages
      }
    end
    # binding.pry
  end

  def show
    # idをキーに1件取得
    # binding.pry
  end
  def edit
  end
  def update
    @board.update(board_params)

    # 詳細画面へリダイレクト
    redirect_to @board
  end

  def destroy
    @board.delete

    redirect_to boards_path, flash: { notice:"「#{@board.title}」の掲示板が削除されました" }
  end

  private
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

  def set_tagrget_board
    @board = Board.find(params[:id])
  end
end
