const prisma = require('../config/prisma');

const getProjects = async (req, res) => {
  try {
    const projects = await prisma.project.findMany({
      orderBy: {
        createdAt: 'desc',
      },
    });

    res.json(projects);
  } catch (error) {
    console.error('Error fetching projects:', error);
    res.status(500).json({ error: 'Failed to fetch projects' });
  }
};

const createProject = async (req, res) => {
  try {
    const { title, description, skills, role, impact } = req.body;

    if (!title || !description || !skills || !role || !impact) {
      return res.status(400).json({
        error: 'All fields are required',
      });
    }

    const project = await prisma.project.create({
      data: {
        title,
        description,
        skills,
        role,
        impact,
      },
    });

    res.status(201).json(project);
  } catch (error) {
    console.error('Error creating project:', error);
    res.status(500).json({ error: 'Failed to create project' });
  }
};

module.exports = {
  getProjects,
  createProject,
};