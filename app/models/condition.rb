class Condition < ActiveHash::Base

  self.data = [
    {id: 1, name: '新品・未使用'}, {id: 2, name: '目立った傷や汚れなし'}, {id: 3, name: '傷あり'},
  ]

end