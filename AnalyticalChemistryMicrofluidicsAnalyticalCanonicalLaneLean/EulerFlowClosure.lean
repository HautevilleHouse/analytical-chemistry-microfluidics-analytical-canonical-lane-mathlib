import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean.MicrofluidicsAdmissibleObject

namespace HautevilleHouse
namespace AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def EulerClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A ∧ primitiveEulerInvariant.invariantsChecked

theorem euler_closure_checked (A : AdmissibleClass) : EulerClosure A := by
  exact And.intro (bridge_from_admissible_class A) (And.intro (gate_from_admissible_class A) rfl)

end AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean
end HautevilleHouse
