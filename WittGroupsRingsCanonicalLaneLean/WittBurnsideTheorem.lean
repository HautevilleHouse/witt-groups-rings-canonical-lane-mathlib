import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.WittGroupsRingsCanonicalLaneLean.WittGroupRingDefs

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure WittBurnsidePackage (p : ℕ) (R : Type u) [CommRing R] where
  wreathProduct : Group
  representation : Group → Type v
  finGenAbelian : Prop
  representationFrobeniusCompatible : Prop

structure WittBurnsideEvidence (p : ℕ) (R : Type u) [CommRing R] (W : WittBurnsidePackage p R) where
  finGenAbelianClosed : W.finGenAbelian
  representationFrobeniusCompatibleClosed : W.representationFrobeniusCompatible

def WittBurnsideClosed (p : ℕ) (R : Type u) [CommRing R] (W : WittBurnsidePackage p R) : Prop :=
  W.finGenAbelian ∧ W.representationFrobeniusCompatible

theorem witt_burnside_closed_from_evidence (p : ℕ) (R : Type u) [CommRing R] (W : WittBurnsidePackage p R) (E : WittBurnsideEvidence p R W) : WittBurnsideClosed p R W := by
  exact And.intro E.finGenAbelianClosed E.representationFrobeniusCompatibleClosed

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse