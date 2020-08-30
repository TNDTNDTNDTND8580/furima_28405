class Category < ActiveHash::Base

  self.data = [
    {id: 1, name: 'レジャー'}, {id: 2, name: 'トレーニング'}, {id: 3, name: '家具'},
    {id: 4, name: 'お土産'}
  ]


end
