#メモアプリを作成する
require "csv" # CSVファイルを扱うためのライブラリを読み込む
loop do
puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
memo_type = gets.to_i  # ユーザーの入力値を取得し、数字へ変換

if memo_type == 1
    puts "メモを作成します"
    puts "拡張子を除いたファイル名を入力してください"
    file_name= gets.chomp + ".csv"

    puts "メモを入力してください（終了時はEnter→ctrl+D）"
    CSV.open(file_name,"w") do |csv|
        while (memo = gets)
            csv << [memo.chomp]
        end
end

puts "メモが保存されました（ファイル名は#{file_name}）"

elsif memo_type == 2
    puts "メモの編集をします"
    puts "既存のメモのファイル名を（拡張子を除いて）入力してください"
    file_name = gets.chomp + ".csv"

    puts"メモを編集してください（終了時はEnter→ctrl+D）"
    CSV.open(file_name,"a") do |csv|
        while (memo = gets)
            csv << [memo.chomp]
        end
end
    puts "メモが保存されました（ファイル名は#{file_name}）"

else 
    puts"エラー、1か2を選択してください"
end
end
