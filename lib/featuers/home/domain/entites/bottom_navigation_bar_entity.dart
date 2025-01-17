import '../../../../../core/utils/assets.dart';

class BottomNavigationBarEntity
{
  final String activeImage,inActiveImage;
  final String name;

  const BottomNavigationBarEntity({required this.activeImage, required this.inActiveImage, required this.name});

}
List<BottomNavigationBarEntity> get bottomNavigationBarItems
{
  return const [
    BottomNavigationBarEntity(activeImage: Assets.imagesHomeFilled, inActiveImage: Assets.imagesHomeOutlined, name: 'الرئيسية'),
    BottomNavigationBarEntity(activeImage: Assets.imagesProductsFilled, inActiveImage: Assets.imagesProductsOutlined, name: 'المنتجات'),
    BottomNavigationBarEntity(activeImage: Assets.imagesShoppingCartFilled, inActiveImage: Assets.imagesShoppingCartOutlined, name: 'سلة التسوق'),
    BottomNavigationBarEntity(activeImage: Assets.imagesUserFilled, inActiveImage: Assets.imagesUserOutlined, name: 'حسابي'),
  ];
}