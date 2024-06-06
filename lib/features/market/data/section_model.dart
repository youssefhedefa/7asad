class SectionModel{
  final String label;
  final String icon;
  final bool? isSelected;

  SectionModel({required this.label, required this.icon, this.isSelected, });
}

enum ProductCategories {
  crops,
  fruit,
  animalProducts,
  seeds,
  vegetables,
  dairyProducts,
  agriculturalEquipment,
  agriculturalTools,
  medicine,
}
const productCategoriesValues = {
  ProductCategories.crops: 'محاصيل',
  ProductCategories.fruit: 'فاكهة',
  ProductCategories.animalProducts: 'منتجات حيوانية',
  ProductCategories.seeds: 'تقاوي',
  ProductCategories.vegetables: 'خضار',
  ProductCategories.dairyProducts: 'منتجات البان',
  ProductCategories.agriculturalEquipment: 'معدات زراعية',
  ProductCategories.agriculturalTools: 'أدوات زراعية',
  ProductCategories.medicine: 'أدوية',};
