class BiologicalSex < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'その他' },
    { id: 3, name: '男性' },
    { id: 4, name: '女性' }
  ]
end