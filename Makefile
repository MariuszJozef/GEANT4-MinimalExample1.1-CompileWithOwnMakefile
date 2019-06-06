EXECUTABLE := Geant4-MinimalWorkingExample1 

HDRDIR := hdr
SRCDIR := src
OBJDIR := obj
#DEPDIR := dep
DEPDIR := $(OBJDIR)
BINDIR := .

SRCEXT := cpp
HDREXT := hh

MAINFILE := $(EXECUTABLE).$(SRCEXT)
HDRFILES := $(wildcard $(HDRDIR)/*.${HDREXT})
SRCFILES := $(wildcard $(SRCDIR)/*.$(SRCEXT))
OBJFILES := $(patsubst $(SRCDIR)/%.${SRCEXT},$(OBJDIR)/%.o,$(SRCFILES))
OBJFILES += $(OBJDIR)/$(EXECUTABLE).o
DEPFILES := $(patsubst $(SRCDIR)/%.${SRCEXT},$(DEPDIR)/%.d,$(SRCFILES))
DEPFILES += $(DEPDIR)/$(EXECUTABLE).d

CXX := g++
CPPFLAGS := -MMD -MP
CXXFLAGS := `/Applications/GEANT4again/geant4.10.03.p01-install/bin/geant4-config --cflags`
LDFLAGS := `/Applications/GEANT4again/geant4.10.03.p01-install/bin/geant4-config --libs`


$(BINDIR)/$(EXECUTABLE): $(OBJFILES) 
	$(CXX) $(LDFLAGS) -o $@ $(OBJFILES) 

$(OBJDIR)/%.o: $(SRCDIR)/%.${SRCEXT} 
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -I$(HDRDIR) -c $< -o $@

$(OBJDIR)/$(EXECUTABLE).o: $(EXECUTABLE).$(SRCEXT)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -I$(HDRDIR) -c $< -o $@

-include $(DEPFILES)	

.PHONY: clean
clean: 
	rm -f $(BINDIR)/${EXECUTABLE} ${OBJDIR}/*.{o,d} 
