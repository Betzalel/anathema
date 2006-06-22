package net.sf.anathema.demo.character.equipment.statscreation;

import net.disy.commons.swing.dialog.wizard.WizardDialog;
import net.sf.anathema.character.equipment.creation.EquipmentTypeChoicePresenterPage;
import net.sf.anathema.character.equipment.creation.IEquipmentStatisticsCreationViewFactory;
import net.sf.anathema.character.equipment.creation.model.IEquipmentStatisticsCreationModel;
import net.sf.anathema.character.equipment.impl.creation.EquipmentStatisticsCreationViewFactory;
import net.sf.anathema.character.equipment.impl.creation.model.EquipmentStatisticsCreationModel;
import net.sf.anathema.framework.resources.AnathemaResources;
import net.sf.anathema.lib.gui.wizard.AnathemaWizardDialog;
import de.jdemo.extensions.SwingDemoCase;

public class EquipmentStatisticsCreationWizardDemo extends SwingDemoCase {

  public void demo() {
    AnathemaResources resources = new AnathemaResources();
    IEquipmentStatisticsCreationModel model = new EquipmentStatisticsCreationModel();
    IEquipmentStatisticsCreationViewFactory viewFactory = new EquipmentStatisticsCreationViewFactory();
    EquipmentTypeChoicePresenterPage startPage = new EquipmentTypeChoicePresenterPage(resources, model, viewFactory);
    WizardDialog dialog = new AnathemaWizardDialog(createParentComponent(), startPage);
    show(dialog.getConfiguredDialog().getWindow());
  }
}