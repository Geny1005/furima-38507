class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'メンズ' },
    { id: 4, name: 'ベビー・キッズ' },
    { id: 5, name: 'インテリア' },
    { id: 6, name: '住まい' },
    { id: 7, name: '小物' },
    { id: 8, name: '本・音楽・ゲーム' },
    { id: 9, name: 'おもちゃ・ホビー・グッズ' },
    { id: 10, name: '家電・スマホ・カメラ、スポーツ・レジャー、ハンドメイド' },
    { id: 11, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :items

  end