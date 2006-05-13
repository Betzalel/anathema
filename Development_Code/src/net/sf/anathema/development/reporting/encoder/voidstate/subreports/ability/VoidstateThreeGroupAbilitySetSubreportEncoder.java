package net.sf.anathema.development.reporting.encoder.voidstate.subreports.ability;

import java.util.Map;

import net.sf.anathema.character.generic.framework.reporting.parameters.AbilityParameterUtilities;
import net.sf.anathema.character.reporting.pageformat.IVoidStateFormatConstants;
import net.sf.anathema.development.reporting.encoder.AbstractPagedCharacterSheetEncoder;
import net.sf.anathema.development.reporting.encoder.ICharacterSheetPageEncoder;
import net.sf.anathema.development.reporting.encoder.voidstate.format.VoidstateBasicsEncoder;
import net.sf.anathema.development.reporting.encoder.voidstate.util.SubreportUtilities;

public class VoidstateThreeGroupAbilitySetSubreportEncoder extends AbstractPagedCharacterSheetEncoder implements
    IVoidStateFormatConstants {

  private final VoidstateBasicsEncoder basicsEncoder;

  public VoidstateThreeGroupAbilitySetSubreportEncoder(VoidstateBasicsEncoder basicsEncoder) {
    super(SubreportUtilities.createPageFormat(AbstractVoidstateAbilitySetPageEncoder.calculateExtents(basicsEncoder)));
    this.basicsEncoder = basicsEncoder;
  }

  @Override
  protected ICharacterSheetPageEncoder[] getPageEncoders() {
    return new ICharacterSheetPageEncoder[] { new VoidstateThreeGroupAbilitySetPageEncoder(basicsEncoder) };
  }

  @Override
  protected void addParameterClasses(Map<String, String> parameterClasses) {
    AbilityParameterUtilities.addRevisedAbilityParameterClasses(parameterClasses);
  }

  @Override
  protected String getReportName() {
    return "VoidstateThreeGroupAbilitySetSubreport";
  }
}