import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure WittRing (R : Type) [CommRing R] where
  carrier : R
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  frobenius : carrier → carrier
  restriction : carrier → carrier

structure AdmissibleClass where
  object : WittRing ℤ
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  WittRingClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def WittRingClosed (W : WittRing ℤ) : Prop :=
  True

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse