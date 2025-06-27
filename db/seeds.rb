Spree::Core::Engine.load_seed if defined?(Spree::Core)

hp_store = Spree::Store.find_by(name: 'Happy Parents')
raise "Happy Parents store not found" unless hp_store

# =========== Вікові категорії ===========

ages_taxonomy = Spree::Taxonomy.find_or_create_by!(name: 'Вікова категорія', store: hp_store)

ages_root_taxon = ages_taxonomy.root || Spree::Taxon.find_or_create_by!(
  name: ages_taxonomy.name,
  taxonomy: ages_taxonomy
)

age_categories = [
  '0 – 1 р.',
  '1 – 3 р.',
  '3 – 5 р.',
  '5 – 7 р.',
  '7 – 14 р.',
  '14+ р.'
]

age_categories.each do |category|
  Spree::Taxon.find_or_create_by!(
    name: category,
    parent: ages_root_taxon,
    taxonomy: ages_taxonomy
  )
end

# =========== Книги ===========
#
books_taxonomy = Spree::Taxonomy.find_or_create_by!(name: 'Книги', store: hp_store)

books_root_taxon = books_taxonomy.root || Spree::Taxon.find_or_create_by!(
  name: books_taxonomy.name,
  taxonomy: books_taxonomy
)

book_categories = %w[
  Віммельбух
  Казки
  Казкотерапія
  Абетки
  Енциклопедії
  Батькам
]

book_categories.each do |category|
  Spree::Taxon.find_or_create_by!(
    name: category,
    parent: books_root_taxon,
    taxonomy: books_taxonomy
  )
end

# =========== Іграшки ===========
#
toys_taxonomy = Spree::Taxonomy.find_or_create_by!(name: 'Іграшки', store: hp_store)

toys_root_taxon = toys_taxonomy.root || Spree::Taxon.find_or_create_by!(
  name: toys_taxonomy.name,
  taxonomy: toys_taxonomy
)

toys_categories = [
  'Конструктори',
  'Картки Домана',
  'Ігри Нікітіних',
  'Пальчікові лабіринти',
  'Рамки-вкладиші',
  'Сортери',
  'Стучалки',
  'Шнуровки',
  '3D-пазли',
  'Кубіки і пірамідки',
  'Головоломки',
  'Пазли',
  'Мозаїка',
  'Конструктори',
  'Настільні ігри',
  'Наукові досліди',
  'Сюжетно-рольові ігри',
  'Набори для творчості',
  'музичні іграшки',
  'Каталки і ходунки',
  'Тренажери для письма',
  'Ляльки'
]

toys_categories.each do |category|
  Spree::Taxon.find_or_create_by!(
    name: category,
    parent: toys_root_taxon,
    taxonomy: toys_taxonomy
  )
end

# =========== Розвиваюча функція ===========
#
skills_taxonomy = Spree::Taxonomy.find_or_create_by!(name: 'Розвиваюча функція', store: hp_store)

skills_root_taxon = skills_taxonomy.root || Spree::Taxon.find_or_create_by!(
  name: skills_taxonomy.name,
  taxonomy: skills_taxonomy
)

skills_categories = [
  'Логіка та мислення',
  'Математичні здібності',
  'Читання',
  'Вивчення навколишнього світу',
  'Творчість',
  'Фізичний розвиток',
  'Формування характеру',
  'Моторика',
  "Пам'ять",
  'Мовлення',
]

skills_categories.each do |category|
  Spree::Taxon.find_or_create_by!(
    name: category,
    parent: skills_root_taxon,
    taxonomy: skills_taxonomy
  )
end
