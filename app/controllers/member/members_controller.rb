class Member::MembersController < ApplicationController



  def goods   #いいね一覧を表示させるためのアクション
    if member_signed_in?
      goods = Good.where(Member_id: current_member.id).pluck(:recipe_id)
      @recipes = Recipe.find(goods)
    else
      redirect_to root_path
    end
  end


  #　処理の説明
  #  　レシピid 1, 2, 3, 4, 5, 6, 7, 8　のレシピがあるとする
  #  　レシピid 2, 5, 6　にidが1のユーザーがいいねを押す
  #  　Good(いいね)モデル内に
  #     　member_id(1), recipe_id(2)
  #     　member_id(1), recipe_id(5)
  #     　member_id(1), recipe_id(6)
  #　　この三つのデータが格納される
  #　　Goodテーブルからmember_idがcurrent_member.id(今回は1 )と一致するものを探す
  # 　 23(一つ上)行目の処理が7行目の　　Good.where(Member_id: current_member.id)
  #  　一致したデータのrecipe_idを配列として変数goodsに格納する(今回は19~21行目の三つのrecipe_id)
  #　　変数goodsに格納されたrecipe_idの配列(今回は2, 5, 6)と一致するrecipe.idのレシピをRecipeモデルにとってきてもらう
  #  　@recipesに格納してviewへと繋がる

end
