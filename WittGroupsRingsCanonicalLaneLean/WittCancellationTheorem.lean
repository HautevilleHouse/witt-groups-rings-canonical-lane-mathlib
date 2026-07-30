import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace WittGroupsRingsCanonicalLaneLean

structure WittCancellationTheorem where
  anisotropicForm : Type u
  isometricForms : anisotropicForm → anisotropicForm → Prop
  cancellationProperty : ∀ (a b c : anisotropicForm), isometricForms a b ∧ isometricForms a c → isometricForms b c

structure WittCancellationEvidence (W : WittCancellationTheorem) where
  cancellationPropertyClosed : W.cancellationProperty

def WittCancellationClosed (W : WittCancellationTheorem) : Prop :=
  W.cancellationProperty

theorem witt_cancellation_closed_from_evidence (W : WittCancellationTheorem) (E : WittCancellationEvidence W) :
    WittCancellationClosed W := by
  exact E.cancellationPropertyClosed

end WittGroupsRingsCanonicalLaneLean
end HautevilleHouse
