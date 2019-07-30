module KeyGen
#
#   def count_up_keys_to_99
#     range = (0..99)
#     number_2 = []
#     range.each do |n|
#       number_2 << ("0" * (5 - n.to_s.length) + n.to_s)
#       n += 1
#     end
#     number_2
#   end
#
#   def count_up_keys_to_9
#     range = (0..9)
#     number_2 = []
#     range.each do |n|
#       number_2 <<  n.to_s
#       n += 1
#     end
#     number_2
#   end
#
#
#   def first_key(e_message, date)
#     # range = (0..99)
#     a = find_shift_of_last_four(e_message)
#     count_up_keys_to_99.find do |key|
#       decrypted = decrypt(e_message, key, date)
#         decrypted[:decryption][a[:D][1]] == find_expected_last_four(e_message)[:D]
#     end
#   end
#
#   def find_other_keys(e_message, date)
#       a = find_shift_of_last_four(e_message)
#       count_up_keys_to_9.find do |k|
#         key = ("00" + k + first_key(e_message, date)[-2..-1])
#         decrypted = decrypt(e_message, key, date)
#           decrypted[:decryption][a[:D][1]] == find_expected_last_four(e_message)[:D]
#       end
#   end

end
