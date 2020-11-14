require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.chomp

#続きを書いていきましょう！！(ifで条件分岐)

if memo_type == "1"
  
  puts "拡張子を除いたファイル名を入力して下さい"
  
  filename = gets.chomp
  
  puts "メモ内容を入力して下さい"
  
  puts "改行はエンターキー、終了する場合はcontrol + Dを入力して下さい"
  
  inputs = $stdin.read.split("\n")

  CSV.open("#{filename}.csv", "w") do |csv|
    csv << inputs
  end
  
  puts "ファイルの内容が以下のようになりました。一行毎に[]でまとめられています。"
  
  created_data_list = CSV.read("#{filename}.csv")
  
  p created_data_list
  
elsif memo_type == "2"
  
  puts "編集するファイル名(拡張子を除く)を入力して下さい"
  
  edit_filename = gets.chomp
  
  data_lists = CSV.read("#{edit_filename}.csv")
  
  puts "編集するファイルの内容はこちらです。一行毎に[]でまとめられています。"
  
  p data_lists
  
  puts "編集方法を選択して下さい"
  
  puts "3(特定の行の書き換え)　4(既存のメモに追記)"
  
  edit_mode = gets.chomp
  
    if edit_mode == "3"
      
      puts "編集する行番号を入力して下さい(左から0, 1, 2,...)"
      row_number = gets.chomp.to_i
      
      puts "変更されるのは次の行です。"
      p data_lists[row_number]

      puts "行内で変更する要素を入力して下さい（左から0, 1, 2,...）"
      column_number = gets.chomp.to_i
      
      puts "変更されるのは次の要素です。"
      puts data_lists[row_number][column_number]
      
      puts "変更内容を入力して下さい"
      data_lists[row_number][column_number] = gets.chomp.to_s     #ここまでだけだと保存はされていない
      
      i = 0                                                       #ここで上書き保存
      len = data_lists.length
      CSV.open("#{edit_filename}.csv", "w") do |csv|
        while i < len do
          csv << data_lists[i]
          i += 1
        end
      end

      puts "ファイルは次のように変更されました。"
      p data_lists
      
    elsif edit_mode == "4"
      
      puts "追記するメモ内容を入力して下さい"
      
      puts "改行はエンターキー、終了する場合はcontrol + Dを入力して下さい"
      
      add_inputs = $stdin.read.split("\n")

      CSV.open("#{edit_filename}.csv", "a") do |csv|
        csv << add_inputs
      end
      
      puts "ファイルの内容が以下のように変更されました"
      
      added_data_list = CSV.read("#{edit_filename}.csv")
      
      p added_data_list
      
    else
      
      puts "3もしくは4を入力して下さい"
      
    end
    
else 
  
  puts "1もしくは2を入力して下さい"
  
end
  