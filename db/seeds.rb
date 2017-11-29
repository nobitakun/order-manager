# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ユーザー登録
root_user = User.new(name: 'root user', email: 'root@root.com', root: true, admin: true)
root_user.password = 'root'
root_user.password_confirmation = 'root'
root_user.save!

admin_user = User.new(name: '管理者', email: 'admin@admin.com', root: false, admin: true)
admin_user.password = 'admin'
admin_user.password_confirmation = 'admin'
admin_user.save!

test_user = User.new(name: 'テストユーザー', email: 'test@test.com', root: false, admin: false)
test_user.password = 'test'
test_user.password_confirmation = 'test'
test_user.save!

# 顧客登録
admin_user.projects.create(name: '雛形', code: '000')
admin_user.projects.create(name: 'テスト顧客', current_postal_code: '330-0001', postal_code: '150-0001', current_adress: '埼玉県さいたま市中央区某所', adress: '東京都渋谷区神宮前1-2-3', current_phone: '048-123-1234', phone: '03-1234-1234', owner_phone: '090-1234-5678', code: '001')

# 部材カテゴリー&部材登録
ItemCategory.create(name: '養生 足場 産廃')
ItemCategory.create(name: '建築資材 外部用')
ItemCategory.create(name: '建築資材 内部用')
ItemCategory.create(name: '構造躯体')

yane = ItemCategory.new(name: '屋根')
yane.save!

yane.items.create(name: 'コロニアルクアッド', unit: '㎡')
yane.items.create(name: 'コロニアルグラッサ', unit: '㎡')
yane.items.create(name: '瓦 スーパートライ', unit: '㎡')

gaiheki = ItemCategory.new(name: '外壁')
gaiheki.save!

gaiheki.items.create(name: '東レ タテスリーライン', unit: '㎡')

ItemCategory.create(name: '窓 ドア')
ItemCategory.create(name: '基礎')
ItemCategory.create(name: '床')
ItemCategory.create(name: '建具 階段')
ItemCategory.create(name: '断熱')
ItemCategory.create(name: '塗装')
ItemCategory.create(name: 'タイル')
ItemCategory.create(name: 'キッチン')
ItemCategory.create(name: '洗面台')
ItemCategory.create(name: 'トイレ')
ItemCategory.create(name: 'ユニットバス')
ItemCategory.create(name: '給湯器 換気システム')
ItemCategory.create(name: 'インターホン')
ItemCategory.create(name: '電気配線 エアコン工事')
ItemCategory.create(name: '給排水')
ItemCategory.create(name: '照明器具')
ItemCategory.create(name: 'カーテン')
ItemCategory.create(name: '地盤調査 設計 申請')
ItemCategory.create(name: '意匠図 確認申請')
ItemCategory.create(name: '構造図')
ItemCategory.create(name: '管理費 運送費')
ItemCategory.create(name: 'その他')

#発注先登録
Partner.create(name: '株式会社 ハヤカワ', kana: 'はやかわ', postal_code: '273-0853', adress: '船橋市金杉8丁目20-5', phone: '047-448-6711', fax: '047-448-6610', staff: '大島', staff_phone: '080-5542-0071')
Partner.create(name: '株式会社 海山商事', kana: 'うみやましょうじ', postal_code: '150-0001', adress: '東京都渋谷区神宮前1-2-3', phone: '03-1234-5678', fax: '03-1234-5679', staff: '渡辺', staff_phone: '090-9999-9999')
Partner.create(name: '株式会社 山川商事', kana: 'やまかわしょうじ', postal_code: '150-0022', adress: '東京都港区南青山3-3-3', phone: '03-1111-2222', fax: '03-1111-2223', staff: '斎藤', staff_phone: '090-1111-2222')
Partner.create(name: 'ガデリウス インダストリー', kana: 'がでりうす', postal_code: '150-0022', adress: '東京都某所', phone: '03-1111-2222', fax: '03-1111-2223', staff: '何某', staff_phone: '090-1111-2222')
Partner.create(name: '株式会社アライ', kana: 'あらい', postal_code: '150-0022', adress: '東京都某所', phone: '03-1111-2222', fax: '03-1111-2223', staff: '何某', staff_phone: '090-1111-2222')
Partner.create(name: '株式会社石塚測量', kana: 'いしい', postal_code: '150-0022', adress: '東京都某所', phone: '03-1111-2222', fax: '03-1111-2223', staff: '何某', staff_phone: '090-1111-2222')
Partner.create(name: '入江タイル', kana: 'いりえ', postal_code: '150-0022', adress: '東京都某所', phone: '03-1111-2222', fax: '03-1111-2223', staff: '何某', staff_phone: '090-1111-2222')
Partner.create(name: '菊池内装', kana: 'きくち', postal_code: '150-0022', adress: '東京都某所', phone: '03-1111-2222', fax: '03-1111-2223', staff: '何某', staff_phone: '090-1111-2222')
Partner.create(name: '小林ブロック', kana: 'こばやし', postal_code: '150-0022', adress: '東京都某所', phone: '03-1111-2222', fax: '03-1111-2223', staff: '何某', staff_phone: '090-1111-2222')
