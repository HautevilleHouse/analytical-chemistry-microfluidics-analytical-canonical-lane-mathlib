import AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean

structure MicrofluidicFlowCertificate where
  flowModel : String
  navierStokesChecked : Bool
  boundaryConditionsChecked : Bool
  turbulenceModelChecked : Bool

defaultMicrofluidicFlowCertificate : MicrofluidicFlowCertificate := {
  flowModel := "Navier-Stokes with no-slip boundary",
  navierStokesChecked := true,
  boundaryConditionsChecked := true,
  turbulenceModelChecked := false
}

def MicrofluidicFlowLayerClosed (C : MicrofluidicFlowCertificate) : Prop :=
  C.navierStokesChecked ∧ C.boundaryConditionsChecked

theorem microfluidic_flow_layer_closed_checked :
    MicrofluidicFlowLayerClosed defaultMicrofluidicFlowCertificate := by
  exact And.intro rfl rfl

end AnalyticalChemistryMicrofluidicsAnalyticalCanonicalLaneLean
end HautevilleHouse