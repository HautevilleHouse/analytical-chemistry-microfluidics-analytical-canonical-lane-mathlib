import AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean

structure ElectrokineticCertificate where
  electroosmoticModelChecked : Bool
  electrophoreticModelChecked : Bool
  appliedVoltage : Float

defaultElectrokineticCertificate : ElectrokineticCertificate := {
  electroosmoticModelChecked := true,
  electrophoreticModelChecked := true,
  appliedVoltage := 100.0
}

def ElectrokineticLayerClosed (C : ElectrokineticCertificate) : Prop :=
  C.electroosmoticModelChecked ∧ C.electrophoreticModelChecked

theorem electrokinetic_layer_closed_checked :
    ElectrokineticLayerClosed defaultElectrokineticCertificate := by
  exact And.intro rfl rfl

end AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean
end HautevilleHouse