package net.sf.anathema.character.view;

import net.sf.anathema.character.library.intvalue.IIntValueDisplayFactory;
import net.sf.anathema.character.view.advance.IExperienceConfigurationView;
import net.sf.anathema.character.view.magic.IMagicViewFactory;
import net.sf.anathema.character.view.overview.IOverviewView;
import net.sf.anathema.framework.presenter.view.IMultiContentView;
import net.sf.anathema.framework.view.IItemView;
import net.sf.anathema.lib.gui.IDisposable;

public interface ICharacterView extends IItemView {

  public ICharacterDescriptionView createCharacterDescriptionView();

  public IOverviewView addCreationOverviewView();

  public IOverviewView addExperienceOverviewView();

  public IExperienceConfigurationView createExperienceConfigurationView();

  public void toogleOverviewView(boolean experienced);

  public IMultiContentView addMultiContentView(String header);

  public IIntValueDisplayFactory getIntValueDisplayFactory();

  public void addDisposable(IDisposable disposable);

  public ICharacterConceptAndRulesViewFactory createConceptViewFactory();

  public IAdvantageViewFactory createAdvantageViewFactory();

  public IMagicViewFactory createMagicViewFactory();

  public IGroupedFavorableTraitViewFactory createGroupedFavorableTraitViewFactory();
}