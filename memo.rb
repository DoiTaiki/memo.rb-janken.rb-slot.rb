require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.chomp

#続きを書いていきましょう！！(ifで条件分岐)

if memo_type == "1"
  
  puts "拡張子を除いたファイル名を入力して下さい"
  
  filename = gets.chomp
  
  puts "メモ内容を入力して下さい"
  
  puts "改行はエンターキー、終了する場合はcontrol + Dを入力して下さい"
  
  inputs = $stdin.readlines
  len = inputs.length
  i = 0

  while i < len
      inputs[i] = inputs[i].chomp
      i += 1
  end
  
  CSV.open("#{filename}.csv", "w") do |csv|
      csv << inputs
  end
  
  puts "ファイルの内容が以下のようになりました"
  
  created_data_list = CSV.read("#{filename}.csv")
  
  puts created_data_list
  
elsif memo_type == "2"
  
  puts "編集するファイル名(拡張子を除く)を入力して下さい"
  
  edit_filename = gets.chomp
  
  data_list = CSV.read("#{edit_filename}.csv")
  
  puts "編集するファイルの内容はこちらです"
  
  puts data_list
  
  puts "編集方法を選択して下さい"
  
  puts "3(特定の行の書き換え)　4(既存のメモに追記)"
  
  edit_mode = gets.chomp
  
    if edit_mode == "3"
      
      data_list_array = data_list.split(',')
      
      puts "編集する要素番号を入力して下さい(上から0, 1, 2,...)"
      
      culumn_number = gets.chomp.to_i
      
      puts "変更するメモ内容を入力して下さい"
      
      data_list_array[culumn_number] = gets.chomp
      
      changed_len = data_list_array.length
      k = 0
    
      while k < changed_len
          data_list_array[k] = data_list_array[k].chomp
          k += 1
      end
      
      CSV.open("#{edit_filename}.csv", "w") do |csv|
          csv << data_list_array
      end
      
      puts "ファイルの内容が以下のように変更されました"
      
      edited_data_list = CSV.read("#{edit_filename}.csv")
          
      puts edited_data_list
      
    elsif edit_mode == "4"
      
      puts "追記するメモ内容を入力して下さい"
      
      puts "改行はエンターキー、終了する場合はcontrol + Dを入力して下さい"
      
      add_inputs = $stdin.readlines
      add_len = add_inputs.length
      j = 0
      
      while j < add_len
        add_inputs[j] = add_inputs[j].chomp
        j += 1
      end
      
      CSV.open("#{edit_filename}.csv", "a") do |csv|
        csv << add_inputs
      end
      
      puts "ファイルの内容が以下のように変更されました"
      
      added_data_list = CSV.read("#{edit_filename}.csv")
      
      puts added_data_list
      
    else
      
      puts "3もしくは4を入力して下さい"
      
    end
    
else 
  
  puts "1もしくは2を入力して下さい"
  
end
  