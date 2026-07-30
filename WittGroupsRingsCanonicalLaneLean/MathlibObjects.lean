import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure WittSpace where
  carrier : Type u
  topology : TopologicalSpace carrier

structure WittAdmittedObject where
  space : WittSpace
  wittRingStructure : Prop
  formalGroupLaw : Prop
  corepresentable : Prop
  conclusion : corepresentable

def WittWitnessClosed (O : WittAdmittedObject) : Prop :=
  O.corepresentable

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse