import WittGroupsRingsCanonicalLaneLean.WittGroupDefinition

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure WittVectorConstruction where
  underlyingRing : WittRing
  length : ℕ
  vectorType : Type u
  addition : vectorType → vectorType → vectorType
  multiplication : vectorType → vectorType → vectorType
  ghostComponents : vectorType → (ℕ → underlyingRing.carrier)
  ghostComponentAdditive : ∀ x y, ghostComponents (addition x y) = ghostComponents x + ghostComponents y
  ghostComponentMultiplicative : ∀ x y, ghostComponents (multiplication x y) = ghostComponents x * ghostComponents y
  wittPolynomials : ℕ → (ℕ → underlyingRing.carrier) → underlyingRing.carrier
  wittPolynomialsDefiningAddition : Prop
  wittPolynomialsDefiningMultiplication : Prop

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse