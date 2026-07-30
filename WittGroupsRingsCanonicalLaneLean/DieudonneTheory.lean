import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.WittGroupsRingsCanonicalLaneLean.WittGroupRingDefs

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure DieudonnePackage (p : ℕ) (R : Type u) [CommRing R] where
  algebraGroup : GroupAlgebra (WittGroup (Units R))
  dieudonneModule : Module (WittVectorRing p R)
  frobeniusSemilinear : Prop
  verschiebungDefined : Prop

structure DieudonneEvidence (p : ℕ) (R : Type u) [CommRing R] (D : DieudonnePackage p R) where
  frobeniusSemilinearClosed : D.frobeniusSemilinear
  verschiebungDefinedClosed : D.verschiebungDefined

def DieudonneClosed (p : ℕ) (R : Type u) [CommRing R] (D : DieudonnePackage p R) : Prop :=
  D.frobeniusSemilinear ∧ D.verschiebungDefined

theorem dieudonne_closed_from_evidence (p : ℕ) (R : Type u) [CommRing R] (D : DieudonnePackage p R) (E : DieudonneEvidence p R D) : DieudonneClosed p R D := by
  exact And.intro E.frobeniusSemilinearClosed E.verschiebungDefinedClosed

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse