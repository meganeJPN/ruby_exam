# プレイヤー(自分)に「0 ~ 2」を入力させるロジックを書きます。
class Player
  def hand
    # 「プレイヤーに 0 ~ 2を入力させる文章」を表示させます。
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    input_hand = gets
    input_hand = input_hand.to_i if input_hand.gsub(/[^0-9]/,"") != ""
    
    while true
      if [0,1,2].include?(input_hand)
        break
      else
        puts "数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand = gets
        input_hand = input_hand.to_i if input_hand.gsub(/[^0-9]/,"") != ""
      end
    end
    input_hand
  end
end

# 敵が「0 ~ 2」の値をランダムで生成するロジックを書きます。
class Enemy
  def hand
    rand(0..2)
  end
end

# プレイヤー(自分)が入力した「0 ~ 2」と、敵がランダムで生成した「0 ~ 2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
  def pon(player_hand, enemy_hand)
    # 変数「janken」に["グー", "チョキ", "パー"]を代入します。
    janken = ["グー", "チョキ", "パー"]
    #「相手の手は#{敵の生成した値}です。」と出力させます。
    puts "相手の手は#{janken[enemy_hand]}です。"
    puts "あなたの手は#{janken[player_hand]}です。"
    if (player_hand == 0 && enemy_hand == 1)  || (player_hand ==1 && enemy_hand==2 )|| (player_hand == 2 && enemy_hand==0)
      puts "あなたの勝ちです"
    
    elsif player_hand == enemy_hand
      puts "アイコです"
      return true
    else
      puts "あなたの負けです"
    end
  end
end
# 変数「player」にPlayerをインスタンス化したものを代入します。
player = Player.new
# 変数「enemy」にEnemyをインスタンス化したものを代入します。
enemy = Enemy.new
# 変数「janken」にJankenをインスタンス化したものを代入します。
janken = Janken.new

next_game = true

while next_game
  next_game = janken.pon(player.hand,enemy.hand)
end