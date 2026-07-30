import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure WittVectorRing (p : ℕ) (R : Type u) [CommRing R] where
  data : ℕ → R
  addition : (data + data) = data
  multiplication : (data * data) = data
  frobenius : (p : R) = 0 → (∀ n, data (n+1)^p = data n)

structure WittGroup (G : Type u) [Group G] where
  underlyingSet : Set G
  groupOperation : G → G → G
  identity : G
  inverse : G → G
  closedUnderOp : ∀ a b ∈ underlyingSet, groupOperation a b ∈ underlyingSet
  containsIdentity : identity ∈ underlyingSet
  closedUnderInv : ∀ a ∈ underlyingSet, inverse a ∈ underlyingSet

structure WittRingStructure (p : ℕ) (R : Type u) [CommRing R] where
  carrier : Type u
  ring : CommRing carrier
  wittVectorRing : WittVectorRing p carrier
  wittGroup : WittGroup (Units carrier)

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse