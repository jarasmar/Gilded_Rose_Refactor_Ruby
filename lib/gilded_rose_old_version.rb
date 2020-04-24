# require_relative 'item'
#
# class GildedRose
#   def initialize(items)
#     @items = items
#   end
#
#   def update_quality
#     @items.each do |item|
#       # update quality
#       if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
#         if item.quality > 0
#           if item.name != "Sulfuras, Hand of Ragnaros"
#             # if its not brie/backstage/sulfuras
#             # and quality > 0
#             # reduce it by 1
#             item.quality = item.quality - 1
#           end
#         end
#       else
#         if item.quality < 50
#           # if it is brie/backstage/
#           # and quality < 50
#           # increase it by 1
#           item.quality = item.quality + 1
#           if item.name == "Backstage passes to a TAFKAL80ETC concert"
#             if item.sell_in < 11
#               if item.quality < 50
#                 # if it is backstage
#                 # quality < 50
#                 # sell_in is 10-6 days
#                 # increase it by extra 1 (1 + 1)
#                 item.quality = item.quality + 1
#               end
#             end
#             if item.sell_in < 6
#               if item.quality < 50
#                 # if it is backstage
#                 # quality < 50
#                 # sell_in is 5-0 days
#                 # increase it by extra 1 (1 + 1 + 1)
#                 item.quality = item.quality + 1
#               end
#             end
#           end
#         end
#       end
#
#       # update sell_in date
#       if item.name != "Sulfuras, Hand of Ragnaros"
#         # if its not Sulfuras
#         # decrease sell_in by 1
#         item.sell_in = item.sell_in - 1
#       end
#
#       if item.sell_in < 0
#         if item.name != "Aged Brie"
#           if item.name != "Backstage passes to a TAFKAL80ETC concert"
#             if item.quality > 0
#               if item.name != "Sulfuras, Hand of Ragnaros"
#                 # if sell_in date is passed
#                 # and item is not brie/backstage/sulfuras
#                 # and quality is > 0
#                 # decrease quality by extra 1 (1 + 1)
#                 item.quality = item.quality - 1
#               end
#             end
#           else
#             # if sell_in date is passed
#             # and item is backstage
#             # quality drops to 0
#             item.quality = item.quality - item.quality
#           end
#         else
#           if item.quality < 50
#             # if sell_in date is passed
#             # and item is brie
#             # and quality is < 50
#             # quality increases by extra 1 (1 + 1)
#             item.quality = item.quality + 1
#           end
#         end
#       end
#     end
#   end
# end
